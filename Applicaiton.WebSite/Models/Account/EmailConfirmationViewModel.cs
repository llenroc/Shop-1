﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Application.WebSite.Models.Account
{
    public class EmailConfirmationViewModel
    {
        /// <summary>
        /// Encrypted tenant id.
        /// </summary>
        public string TenantId { get; set; }

        /// <summary>
        /// Encrypted user id.
        /// </summary>
        [Required]
        public string UserId { get; set; }

        [Required]
        public string ConfirmationCode { get; set; }
    }
}