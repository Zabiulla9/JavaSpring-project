# provider "aws" {
#  region     = "us-east-2"
#  access_key = " "
#  secret_key = "   "
# }


module "network" {
  source = "./network"
}

module "sg_module" {
  source = "./sg_module"
  vpcid = module.network.vpc_id_op
}

module "ec2_module" {
  source  = "./ec2_module"
  vpcid   = module.network.vpc_id_op
  sb_pub = module.network.pub_sb_op
  sb_pvt = module.network.pvt_sb_op
  sg_git  = module.sg_module.sg_op_gdj
  sg_ans  = module.sg_module.sg_op_ans
  sg_k8   = module.sg_module.sg_op_k8
}
