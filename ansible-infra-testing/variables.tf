variable "ansible_instances" {
    type = list(string)
    #default = [ "front-end","catalogue","mongodb" ,"redis", "user", "cart"]
    default = [ "front-end"]
  
}
/* variable "allowed_ports" {
    type = list(string)
    default = [ "22", "80" ]
  
} */