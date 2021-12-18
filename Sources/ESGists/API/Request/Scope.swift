//
//  Scope.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/21.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

public enum Scope : String, Decodable, Sendable {
	
	/// Grants read-only access to public information (includes public user profile info, public repository info, and gists)
	case none = ""
	
	/// Grants read/write access to profile info only. Note that this scope includes user:email and user:follow.
	case user = "user"
	
	/// Grants read access to a user’s email addresses.
	case user_Email = "user:email"
	
	/// Grants access to follow or unfollow other users.
	case user_Follow = "user:follow"
	
	/// Grants read/write access to code, commit statuses, collaborators, and deployment statuses for public repositories and organizations. Also required for starring public repositories.
	case publicRepo = "public_repo"
	
	/// Grants read/write access to code, commit statuses, collaborators, and deployment statuses for public and private repositories and organizations.
	case repo = "repo"
	
	/// Grants access to deployment statuses for public and private repositories. This scope is only necessary to grant other users or services access to deployment statuses, without granting access to the code.
	case repoDeployment = "repo_deployment"
	
	/// Grants read/write access to public and private repository commit statuses. This scope is only necessary to grant other users or services access to private repository commit statuses without granting access to the code.
	case repo_Status = "repo:status"
	
	/// Grants access to delete adminable repositories.
	case deleteRepo = "delete_repo"
	
	/// Grants read access to a user’s notifications. repo also provides this access.
	case notifications = "notifications"
	
	/// Grants write access to gists.
	case gist = "gist"
	
	/// Grants read and ping access to hooks in public or private repositories.
	case read_RepoHook = "read:repo_hook"
	
	/// Grants read, write, and ping access to hooks in public or private repositories.
	case write_RepoHook = "write:repo_hook"
	
	/// Grants read, write, ping, and delete access to hooks in public or private repositories.
	case admin_RepoHook = "admin:repo_hook"
	
	/// Grants read, write, ping, and delete access to organization hooks. Note: OAuth tokens will only be able to perform these actions on organization hooks which were created by the OAuth application. Personal access tokens will only be able to perform these actions on organization hooks created by a user.
	case admin_OrgHook = "admin:org_hook"
	
	/// Read-only access to organization, teams, and membership.
	case read_Org = "read:org"
	
	/// Publicize and unpublicize organization membership.
	case write_Org = "write:org"
	
	/// Fully manage organization, teams, and memberships.
	case admin_Org = "admin:org"
	
	/// List and view details for public keys.
	case read_PublicKey = "read:public_key"
	
	/// Create, list, and view details for public keys.
	case write_PublicKey = "write:public_key"
	
	/// Fully manage public keys.
	case admin_PublicKey = "admin:public_key"
}
