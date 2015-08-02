//
//  Scope.swift
//  ESGist
//
//  Created by Tomohiro Kumagai on H27/07/21.
//  Copyright © 平成27年 EasyStyle G.K. All rights reserved.
//

import Himotoki

public enum Scope : String {
	
	/// Grants read-only access to public information (includes public user profile info, public repository info, and gists)
	case None = ""
	
	/// Grants read/write access to profile info only. Note that this scope includes user:email and user:follow.
	case User = "user"
	
	/// Grants read access to a user’s email addresses.
	case User_Email = "user:email"
	
	/// Grants access to follow or unfollow other users.
	case User_Follow = "user:follow"
	
	/// Grants read/write access to code, commit statuses, collaborators, and deployment statuses for public repositories and organizations. Also required for starring public repositories.
	case PublicRepo = "public_repo"
	
	/// Grants read/write access to code, commit statuses, collaborators, and deployment statuses for public and private repositories and organizations.
	case Repo = "repo"
	
	/// Grants access to deployment statuses for public and private repositories. This scope is only necessary to grant other users or services access to deployment statuses, without granting access to the code.
	case RepoDeployment = "repo_deployment"
	
	/// Grants read/write access to public and private repository commit statuses. This scope is only necessary to grant other users or services access to private repository commit statuses without granting access to the code.
	case Repo_Status = "repo:status"
	
	/// Grants access to delete adminable repositories.
	case DeleteRepo = "delete_repo"
	
	/// Grants read access to a user’s notifications. repo also provides this access.
	case Notifications = "notifications"
	
	/// Grants write access to gists.
	case Gist = "gist"
	
	/// Grants read and ping access to hooks in public or private repositories.
	case Read_RepoHook = "read:repo_hook"
	
	/// Grants read, write, and ping access to hooks in public or private repositories.
	case Write_RepoHook = "write:repo_hook"
	
	/// Grants read, write, ping, and delete access to hooks in public or private repositories.
	case Admin_RepoHook = "admin:repo_hook"
	
	/// Grants read, write, ping, and delete access to organization hooks. Note: OAuth tokens will only be able to perform these actions on organization hooks which were created by the OAuth application. Personal access tokens will only be able to perform these actions on organization hooks created by a user.
	case Admin_OrgHook = "admin:org_hook"
	
	/// Read-only access to organization, teams, and membership.
	case Read_Org = "read:org"
	
	/// Publicize and unpublicize organization membership.
	case Write_Org = "write:org"
	
	/// Fully manage organization, teams, and memberships.
	case Admin_Org = "admin:org"
	
	/// List and view details for public keys.
	case Read_PublicKey = "read:public_key"
	
	/// Create, list, and view details for public keys.
	case Write_PublicKey = "write:public_key"
	
	/// Fully manage public keys.
	case Admin_PublicKey = "admin:public_key"
}

extension Scope : Decodable {
	
	public static func decode(e: Extractor) -> Scope? {
		
		return String.decode(e).flatMap(Scope.init)
	}
}
