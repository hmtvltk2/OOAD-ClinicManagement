namespace ClinicManager.DataAccess
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;
    using DataModel;

    public partial class ClinicDB : DbContext
    {
        public ClinicDB()
            : base("name=ClinicDB")
        {
        }

        public virtual DbSet<Bill> Bill { get; set; }
        public virtual DbSet<BillDetail> BillDetail { get; set; }
        public virtual DbSet<Detail> Detail { get; set; }
        public virtual DbSet<MedicalRecord> MedicalRecord { get; set; }
        public virtual DbSet<Medicine> Medicine { get; set; }
        public virtual DbSet<MedicineType> MedicineType { get; set; }
        public virtual DbSet<Patient> Patient { get; set; }
        public virtual DbSet<Permission> Permission { get; set; }
        public virtual DbSet<Prescription> Prescription { get; set; }
        public virtual DbSet<PrescriptionDetail> PrescriptionDetail { get; set; }
        public virtual DbSet<PharmacyType> PharmacyType { get; set; }
        public virtual DbSet<Queue> Queue { get; set; }
        public virtual DbSet<Schedule> Schedule { get; set; }
        public virtual DbSet<ScheduleInfo> ScheduleInfo { get; set; }
        public virtual DbSet<Service> Service { get; set; }
        public virtual DbSet<Unit> Unit { get; set; }
        public virtual DbSet<User> User { get; set; }
        public virtual DbSet<UserGroup> UserGroup { get; set; }
        public virtual DbSet<WayToUse> WayToUse { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Bill>()
                .Property(e => e.ServiceFee)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Bill>()
                .Property(e => e.MedicineFee)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Bill>()
                .Property(e => e.Amount)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Bill>()
                .HasMany(e => e.BillDetail)
                .WithRequired(e => e.Bill)
                .HasForeignKey(e => e.ServiceID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<BillDetail>()
                .Property(e => e.ServiceFee)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Detail>()
                .Property(e => e.ServiceFee)
                .HasPrecision(19, 4);

            modelBuilder.Entity<MedicalRecord>()
                .HasMany(e => e.Bill)
                .WithRequired(e => e.MedicalRecord)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MedicalRecord>()
                .HasMany(e => e.Detail)
                .WithRequired(e => e.MedicalRecord)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Medicine>()
                .Property(e => e.Price)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Medicine>()
                .HasMany(e => e.PrescriptionDetail)
                .WithRequired(e => e.Medicine)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MedicineType>()
                .HasMany(e => e.Medicine)
                .WithRequired(e => e.MedicineType)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Patient>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<Patient>()
                .HasMany(e => e.MedicalRecord)
                .WithRequired(e => e.Patient)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Patient>()
                .HasMany(e => e.Queue)
                .WithRequired(e => e.Patient)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Permission>()
                .HasMany(e => e.UserGroup)
                .WithMany(e => e.Permission)
                .Map(m => m.ToTable("PermissionDetail").MapLeftKey("PermissionID").MapRightKey("UserGroupID"));

            modelBuilder.Entity<Prescription>()
                .Property(e => e.Amount)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Prescription>()
                .HasMany(e => e.MedicalRecord)
                .WithRequired(e => e.Prescription)
                .HasForeignKey(e => e.PrescriptionsID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Prescription>()
                .HasMany(e => e.PrescriptionDetail)
                .WithRequired(e => e.Prescription)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PrescriptionDetail>()
                .Property(e => e.MedicineFee)
                .HasPrecision(19, 4);

            modelBuilder.Entity<PharmacyType>()
                .HasMany(e => e.Medicine)
                .WithRequired(e => e.PharmacyType)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Schedule>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<ScheduleInfo>()
                .HasMany(e => e.Schedule)
                .WithRequired(e => e.ScheduleInfo)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Service>()
                .Property(e => e.ServiceFee)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Service>()
                .HasMany(e => e.Detail)
                .WithRequired(e => e.Service)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Unit>()
                .HasMany(e => e.Medicine)
                .WithRequired(e => e.Unit)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Username)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.Bill)
                .WithRequired(e => e.User)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.MedicalRecord)
                .WithRequired(e => e.User)
                .HasForeignKey(e => e.DoctorID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<UserGroup>()
                .HasMany(e => e.User)
                .WithRequired(e => e.UserGroup)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<WayToUse>()
                .HasMany(e => e.Medicine)
                .WithRequired(e => e.WayToUse)
                .WillCascadeOnDelete(false);
        }
    }
}
