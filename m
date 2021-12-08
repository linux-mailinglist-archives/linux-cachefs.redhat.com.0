Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA6446DB07
	for <lists+linux-cachefs@lfdr.de>; Wed,  8 Dec 2021 19:25:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638987936;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4kD3f9jHfxbrYQLr7pJXQKz8E41xhEjpZzLJAB7fHXI=;
	b=b1DlyMc/9kiRutf7ljph6j6udmgABACe7GGhyyUh08YWoxKZCwMPofcYcZWcPr8nik/3yh
	PCVZ5J5VwNAtoAfNYZlZ9GG/nWKP7NopPHEvZMZEa0jlrDMDYBLR6aPmrJJhv6wschsS0s
	H0gEqXd3EOnrJnZGDPlCpjtGkM7N7VY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-470-CsZurUcPMee9fgM92LdFCQ-1; Wed, 08 Dec 2021 13:25:33 -0500
X-MC-Unique: CsZurUcPMee9fgM92LdFCQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D20110151E4;
	Wed,  8 Dec 2021 18:25:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F396918369;
	Wed,  8 Dec 2021 18:25:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA4971809CB8;
	Wed,  8 Dec 2021 18:25:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B8IPSZG015385 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 8 Dec 2021 13:25:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9258613A58; Wed,  8 Dec 2021 18:25:28 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 77F4E694C0;
	Wed,  8 Dec 2021 18:25:16 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: viro@zeniv.linux.org.uk, paul@paul-moore.com, Anna.Schumaker@Netapp.com,
	kolga@Netapp.com
Date: Wed, 08 Dec 2021 18:25:15 +0000
Message-ID: <163898791564.2840238.17416630708291992227.stgit@warthog.procyon.org.uk>
In-Reply-To: <163898788970.2840238.15026995173472005588.stgit@warthog.procyon.org.uk>
References: <163898788970.2840238.15026995173472005588.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, selinux@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-cachefs@redhat.com,
	casey@schaufler-ca.com
Subject: [Linux-cachefs] [RFC PATCH 2/2] security,
 nfs: Provide a hook for fs_context security initialisation
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Provide a security hook through which an LSM can initialise its bit of the
fs_context struct set up during mount.  This provides a way to fix the
problem of an NFS automount not getting to share superblocks because the
security label from its parent doesn't propagate to the automount request.

Implement this hook for SELinux so that it copies the security labels from
the reference dentry (the mountpoint) into the fs_context LSM parameter
block.

Note that this may also be required for Smack.

Without this, fscache may fail to correctly bind the cache to the
superblock because it sees multiple superblocks with the same key when it
should only see one.

I think this behaviour is caused by the patch that added the
sb_mnt_opts_compat hook as this checks to see if the parameters match.

Fixes: 69c4a42d72eb ("lsm,selinux: add new hook to compare new mount to an existing mount")
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Olga Kornievskaia <kolga@netapp.com>
cc: Anna Schumaker <Anna.Schumaker@Netapp.com>
cc: Paul Moore <paul@paul-moore.com>
cc: Casey Schaufler <casey@schaufler-ca.com>
cc: Alexander Viro <viro@zeniv.linux.org.uk>
cc: selinux@vger.kernel.org
cc: linux-security-module@vger.kernel.org
cc: linux-nfs@vger.kernel.org
cc: linux-cachefs@redhat.com
---

 fs/fs_context.c               |    4 +++
 include/linux/lsm_hook_defs.h |    1 +
 include/linux/lsm_hooks.h     |    6 ++++
 include/linux/security.h      |    8 ++++++
 security/security.c           |    5 ++++
 security/selinux/hooks.c      |   57 ++++++++++++++++++++++++++++++++++++++++-
 6 files changed, 78 insertions(+), 3 deletions(-)

diff --git a/fs/fs_context.c b/fs/fs_context.c
index b7e43a780a62..e411826127f3 100644
--- a/fs/fs_context.c
+++ b/fs/fs_context.c
@@ -282,6 +282,10 @@ static struct fs_context *alloc_fs_context(struct file_system_type *fs_type,
 		break;
 	}
 
+	ret = security_fs_context_init(fc, reference);
+	if (ret < 0)
+		goto err_fc;
+
 	/* TODO: Make all filesystems support this unconditionally */
 	init_fs_context = fc->fs_type->init_fs_context;
 	if (!init_fs_context)
diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index 7f5c35d72082..f1eddaf2cd93 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -54,6 +54,7 @@ LSM_HOOK(int, 0, bprm_creds_from_file, struct linux_binprm *bprm, struct file *f
 LSM_HOOK(int, 0, bprm_check_security, struct linux_binprm *bprm)
 LSM_HOOK(void, LSM_RET_VOID, bprm_committing_creds, struct linux_binprm *bprm)
 LSM_HOOK(void, LSM_RET_VOID, bprm_committed_creds, struct linux_binprm *bprm)
+LSM_HOOK(int, 0, fs_context_init, struct fs_context *fc, struct dentry *reference)
 LSM_HOOK(int, 0, fs_context_dup, struct fs_context *fc,
 	 struct fs_context *src_sc)
 LSM_HOOK(int, -ENOPARAM, fs_context_parse_param, struct fs_context *fc,
diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index 73cb0ab2bc03..6b43f5f22fff 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -87,8 +87,12 @@
  * Security hooks for mount using fs_context.
  *	[See also Documentation/filesystems/mount_api.rst]
  *
+ * @fs_context_init:
+ *	Initialises a new security context.
+ *	@fc indicates the new filesystem context.
+ *	@reference points to a reference dentry for a submount (or is NULL).
  * @fs_context_dup:
- *	Allocate and attach a security structure to sc->security.  This pointer
+ *	Allocate and attach a security structure to fc->security.  This pointer
  *	is initialised to NULL by the caller.
  *	@fc indicates the new filesystem context.
  *	@src_fc indicates the original filesystem context.
diff --git a/include/linux/security.h b/include/linux/security.h
index a4f0c421dd0c..647f43d464f0 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -289,6 +289,7 @@ int security_bprm_creds_from_file(struct linux_binprm *bprm, struct file *file);
 int security_bprm_check(struct linux_binprm *bprm);
 void security_bprm_committing_creds(struct linux_binprm *bprm);
 void security_bprm_committed_creds(struct linux_binprm *bprm);
+int security_fs_context_init(struct fs_context *fc, struct dentry *reference);
 int security_fs_context_dup(struct fs_context *fc, struct fs_context *src_fc);
 int security_fs_context_parse_param(struct fs_context *fc, struct fs_parameter *param);
 int security_sb_alloc(struct super_block *sb);
@@ -618,11 +619,18 @@ static inline void security_bprm_committed_creds(struct linux_binprm *bprm)
 {
 }
 
+static inline int security_fs_context_init(struct fs_context *fc,
+					   struct dentry *reference)
+{
+	return 0;
+}
+
 static inline int security_fs_context_dup(struct fs_context *fc,
 					  struct fs_context *src_fc)
 {
 	return 0;
 }
+
 static inline int security_fs_context_parse_param(struct fs_context *fc,
 						  struct fs_parameter *param)
 {
diff --git a/security/security.c b/security/security.c
index 0c49a1f05ac4..50bd3cd77a49 100644
--- a/security/security.c
+++ b/security/security.c
@@ -879,6 +879,11 @@ void security_bprm_committed_creds(struct linux_binprm *bprm)
 	call_void_hook(bprm_committed_creds, bprm);
 }
 
+int security_fs_context_init(struct fs_context *fc, struct dentry *reference)
+{
+	return call_int_hook(fs_context_init, 0, fc, reference);
+}
+
 int security_fs_context_dup(struct fs_context *fc, struct fs_context *src_fc)
 {
 	return call_int_hook(fs_context_dup, 0, fc, src_fc);
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 8ea92f08e6bd..170ed9854153 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -354,7 +354,7 @@ static void inode_free_security(struct inode *inode)
 }
 
 struct selinux_mnt_opts {
-	const char *fscontext, *context, *rootcontext, *defcontext;
+	char *fscontext, *context, *rootcontext, *defcontext;
 };
 
 static void selinux_free_mnt_opts(void *mnt_opts)
@@ -980,7 +980,7 @@ static int selinux_sb_clone_mnt_opts(const struct super_block *oldsb,
 	return rc;
 }
 
-static int selinux_add_opt(int token, const char *s, void **mnt_opts)
+static int selinux_add_opt(int token, char *s, void **mnt_opts)
 {
 	struct selinux_mnt_opts *opts = *mnt_opts;
 
@@ -2800,6 +2800,58 @@ static int selinux_umount(struct vfsmount *mnt, int flags)
 				   FILESYSTEM__UNMOUNT, NULL);
 }
 
+static int selinux_fs_context_init(struct fs_context *fc,
+				   struct dentry *reference)
+{
+	const struct superblock_security_struct *ref_sbsec;
+	struct inode_security_struct *ref_isec;
+	struct selinux_mnt_opts *opts;
+	u32 len;
+	int ret;
+
+	if (fc->purpose != FS_CONTEXT_FOR_SUBMOUNT)
+		return 0;
+
+	ref_sbsec = selinux_superblock(reference->d_sb);
+	if (!ref_sbsec)
+		return 0;
+
+	opts = kzalloc(sizeof(struct selinux_mnt_opts), GFP_KERNEL);
+	if (!opts)
+		return -ENOMEM;
+
+	fc->security = opts;
+
+	if (ref_sbsec->flags & FSCONTEXT_MNT) {
+		ret = security_sid_to_context(&selinux_state, ref_sbsec->sid,
+					      &opts->fscontext, &len);
+		if (ret < 0)
+			return ret;
+	}
+	if (ref_sbsec->flags & CONTEXT_MNT) {
+		ret = security_sid_to_context(&selinux_state, ref_sbsec->mntpoint_sid,
+					      &opts->context, &len);
+		if (ret < 0)
+			return ret;
+	}
+	if (ref_sbsec->flags & DEFCONTEXT_MNT) {
+		ret = security_sid_to_context(&selinux_state, ref_sbsec->def_sid,
+					      &opts->defcontext, &len);
+		if (ret < 0)
+			return ret;
+	}
+
+	/* Should we use the mountpoint context or the root inode context? */
+	if (ref_sbsec->flags & ROOTCONTEXT_MNT) {
+		ref_isec = backing_inode_security(reference);
+		ret = security_sid_to_context(&selinux_state, ref_isec->sid,
+					      &opts->rootcontext, &len);
+		if (ret < 0)
+			return ret;
+	}
+	return 0;
+}
+
 static int selinux_fs_context_dup(struct fs_context *fc,
 				  struct fs_context *src_fc)
 {
@@ -7267,6 +7319,7 @@ static struct security_hook_list selinux_hooks[] __lsm_ro_after_init = {
 	/*
 	 * PUT "ALLOCATING" HOOKS HERE
 	 */
+	LSM_HOOK_INIT(fs_context_init, selinux_fs_context_init),
 	LSM_HOOK_INIT(msg_msg_alloc_security, selinux_msg_msg_alloc_security),
 	LSM_HOOK_INIT(msg_queue_alloc_security,
 		      selinux_msg_queue_alloc_security),


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

