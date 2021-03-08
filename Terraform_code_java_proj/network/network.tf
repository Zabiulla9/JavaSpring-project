resource "aws_vpc" "java_proj" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "java_proj"
  }
}

resource "aws_subnet" "java_sb_pub" {
  # count = 2 #will create 2 subnets
  vpc_id            = aws_vpc.java_proj.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "java_sb_pub"
  }
}

resource "aws_internet_gateway" "java_igw" {
  vpc_id = aws_vpc.java_proj.id

  tags = {
    Name = "java-igw"
  }
}

resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.java_proj.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.java_igw.id
  }

  tags = {
    Name = "pub-rt"
  }
}
resource "aws_route_table_association" "pub_rta" {
  subnet_id      = aws_subnet.java_sb_pub.id
  route_table_id = aws_route_table.pub_rt.id
}

resource "aws_eip" "myeip" {
  depends_on = [aws_internet_gateway.java_igw]
  vpc      = true
}

resource "aws_subnet" "java_sb_pvt" {
  vpc_id            = aws_vpc.java_proj.id
  cidr_block        = "172.16.20.0/24"
  availability_zone = "us-east-2b"

  tags = {
    Name = "java_sb_pvt"
  }
}

resource "aws_nat_gateway" "mynat" {
  allocation_id = aws_eip.myeip.id
  subnet_id     = aws_subnet.java_sb_pub.id
  tags = {
    Name = "pvt-NAT"
  }
}

resource "aws_route_table" "pvt_rt" {
  vpc_id = aws_vpc.java_proj.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.mynat.id
  }

  tags = {
    Name = "pvt-rt"
  }
}

resource "aws_route_table_association" "pvt-rta" {
  subnet_id      = aws_subnet.java_sb_pvt.id
  route_table_id = aws_route_table.pvt_rt.id
}

output "vpc_id_op"{
  value = aws_vpc.java_proj.id
}

output "pub_sb_op" {
  value = aws_subnet.java_sb_pub.id  
}

output "pvt_sb_op" {
  value = aws_subnet.java_sb_pvt.id
}
