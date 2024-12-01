using SqlAccessLibrary.SQL;
using Microsoft.EntityFrameworkCore;

namespace SqlAccessLibrary
{
    public class UserService
    {
        private readonly IDbContextFactory<IscDatabaseContext> _applicationDbContextFactory;

        public UserService(IDbContextFactory<IscDatabaseContext> applicationDbContext)
        {
            _applicationDbContextFactory = applicationDbContext;
        }

        public async Task<List<User>> GetAllUsers()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var users = await dbContext.Users
                .Include(p => p.Articles)
                .Include(p => p.Originators)
                .Include(p => p.ProfileImages)
                .Include(p => p.UserAddresses)
                .Include(p => p.UserGenders)
                .Include(p => p.UserPhoneNumbers)
                .Include(p => p.UserRoles)
                .ToListAsync();
            return users;
        }

        public async Task<bool> AddUser(User user)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.Users.AddAsync(user);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<User?> GetUser(int id)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var user = await dbContext.Users.Include(p => p.Articles)
                .Include(p => p.Originators)
                .Include(p => p.ProfileImages)
                .Include(p => p.UserAddresses)
                .Include(p => p.UserGenders)
                .Include(p => p.UserPhoneNumbers)
                .Include(p => p.UserRoles).FirstOrDefaultAsync(p => p.Id == id);
            if (user == null) { return null; }
            return user;
        }
        
        public async Task<User?> GetUser(String username, String password)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var user = await dbContext.Users
                .Include(p => p.UserRoles)
                .ThenInclude(p=>p.Role)
                .FirstOrDefaultAsync(p => p.UserLogin == username && p.UserPassword == password);
            
            if (user == null) { return null; }
            return user;
        }

        public async Task<bool> UpdateUser(User user)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Users.Update(user);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeleteUser(User user)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(user);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<List<UserAddress>> GetAllUserAddresses()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var userAddresses = await dbContext.UserAddresses.ToListAsync();
            return userAddresses;
        }

        public async Task<bool> AddUserAddress(UserAddress userAddress)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.UserAddresses.AddAsync(userAddress);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<UserAddress?> GetUserAddress(int id)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.UserAddresses.FirstOrDefaultAsync(p => p.UserAddressId == id);
        }

        public async Task<bool> UpdateUserAddress(UserAddress userAddresse)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.UserAddresses.Update(userAddresse);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeleteUserAddress(UserAddress userAddress)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(userAddress);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeleteUserName(UserName user)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(user);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<List<UserGender>> GetAllUserGenders()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var userGenders = await dbContext.UserGenders.ToListAsync();
            return userGenders;
        }

        public async Task<bool> AddUserGender(UserGender user)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.UserGenders.AddAsync(user);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<UserGender?> GetUserGender(int id)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.UserGenders.FirstOrDefaultAsync(p => p.UserGenderId == id);
        }

        public async Task<bool> UpdateUserGender(UserGender userGender)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.UserGenders.Update(userGender);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeleteUserGender(UserGender userGender)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(userGender);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }
        public async Task<List<ProfileImage>> GetAllProfileImages()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var images = await dbContext.ProfileImages.ToListAsync();
            return images;
        }

        public async Task<bool> AddProfileImages(ProfileImage profileImage)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.ProfileImages.AddAsync(profileImage);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<ProfileImage?> GetProfileImage(int id)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.ProfileImages.FirstOrDefaultAsync(p => p.ProfileImageId == id);
        }

        public async Task<bool> UpdateProfileImage(ProfileImage profileImage)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.ProfileImages.Update(profileImage);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeleteProfileImage(ProfileImage profileImage)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(profileImage);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }
        public async Task<List<UserPhoneNumber>> GetAllPhoneNumbers()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var phoneNumber = await dbContext.UserPhoneNumbers.ToListAsync();
            return phoneNumber;
        }

        public async Task<bool> AddUser(UserPhoneNumber userPhoneNumber)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.UserPhoneNumbers.AddAsync(userPhoneNumber);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<UserPhoneNumber?> GetUserPhoneNumber(int id)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.UserPhoneNumbers.FirstOrDefaultAsync(p => p.UserPhoneNumberId == id);
        }

        public async Task<bool> UpdateUserPhoneNumber(UserPhoneNumber userPhoneNumber)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.UserPhoneNumbers.Update(userPhoneNumber);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeleteUserPhoneNumber(UserPhoneNumber userPhoneNumber)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(userPhoneNumber);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<List<UserRole>> GetAllUserRoles()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var userRoles = await dbContext.UserRoles.ToListAsync();
            return userRoles;
        }

        public async Task<bool> AddUserRole(UserRole userRole)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.UserRoles.AddAsync(userRole);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<UserRole?> GetUserRole(int id)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.UserRoles.FirstOrDefaultAsync(p => p.UserRoleId == id);
        }

        public async Task<bool> UpdateUserRole(UserRole userRole)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.UserRoles.Update(userRole);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeleteUserRole(UserRole userRole)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(userRole);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }
        public async Task<List<RoleType>> GetAllRoleTypes()
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            var roleTypes = await dbContext.RoleTypes.ToListAsync();
            return roleTypes;
        }

        public async Task<bool> AddRoleType(RoleType roleType)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                await dbContext.RoleTypes.AddAsync(roleType);
                await dbContext.SaveChangesAsync();
            }
            catch (Exception)
            {
                //Todo improve handling
                return false;
            }

            return true;
        }

        public async Task<RoleType?> GetRoleType(int id)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            return await dbContext.RoleTypes.FirstOrDefaultAsync(p => p.RoleTypeId == id);
        }

        public async Task<bool> UpdateRoleType(RoleType roleType)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.RoleTypes.Update(roleType);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }

        public async Task<bool> DeleteRoleType(RoleType user)
        {
            using var dbContext = _applicationDbContextFactory.CreateDbContext();
            try
            {
                dbContext.Remove(user);
                await dbContext.SaveChangesAsync(true);
            }
            catch (Exception)
            {
                //TODO: improve handling
                return false;
            }
            return true;
        }
    }

}