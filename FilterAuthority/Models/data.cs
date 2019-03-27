using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FilterAuthority.Models
{
    public class data
    {
        public int Id { get; set; }
        public string ModulesName { get; set; }
        public Nullable<int> ParentId { get; set; }
        public string Path { get; set; }
        public Nullable<int> RoleId { get; set; }
        public Nullable<int> ModuleId { get; set; }
        public string RoleName { get; set; }
        public int Weight { get; set; }
        public string Name { get; set; }
        public Nullable<int> UserId { get; set; }
    }
}