resource "aws_db_instance" "rds_kgs" {

    allocated_storage               = 30
    storage_type                    = "gp2"
    engine                          = "mysql"
    engine_version                  = "8.0.20"
    instance_class                  = "db.t2.micro"
    name                            = "rds_db"
    username                        = "dbadmin"
    password                        = "Passw0rd123"
    multi_az                        = true
    port                            = 3306
    db_subnet_group_name            = var.out_rdssubnetgroup
    vpc_security_group_ids          = [var.rdsmysqlsg]
    tags                            = {
            name                    = "RDS MySQL Database"
    }

  
}