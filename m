Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 648F8702A6D
	for <lists+linux-cachefs@lfdr.de>; Mon, 15 May 2023 12:25:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684146331;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lKnWcRWFd5gm/jHMrbWnyFwV+p4/Omv92R1MIo2HCGo=;
	b=T4PWm3TxIpSEtWz7dokeJRot2bLzFTDX5jjJWuWrDUq1jy325KjlrKNlz3vqWKhR/wJTds
	sJbKNnmIeOCdSE9hJG/OCkpP9ZdRDaQclpFT0T+cz3Dord8M7nCBd60NB2rQR/tXoRdFGm
	Tm3RvrpOyO3je24jzWT6Eq2GliKXbF4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-Osz-AVaiNW6nd7pjt8u9LQ-1; Mon, 15 May 2023 06:25:28 -0400
X-MC-Unique: Osz-AVaiNW6nd7pjt8u9LQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F1061381D4C5;
	Mon, 15 May 2023 10:25:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1B2E414152F6;
	Mon, 15 May 2023 10:25:27 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C7E5219465A4;
	Mon, 15 May 2023 10:25:26 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 06B871946A43 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  5 May 2023 08:31:06 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DD138C16024; Fri,  5 May 2023 08:31:06 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D5533C15BA0
 for <linux-cachefs@redhat.com>; Fri,  5 May 2023 08:31:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90F093C0ED6C
 for <linux-cachefs@redhat.com>; Fri,  5 May 2023 08:31:06 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com
 [45.249.212.188]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-4CFGp31GOjetBN27Xhbbag-1; Fri, 05 May 2023 04:31:02 -0400
X-MC-Unique: 4CFGp31GOjetBN27Xhbbag-1
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4QCNcc6Nc2zTkCY;
 Fri,  5 May 2023 16:09:04 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.58) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 5 May 2023 16:13:35 +0800
From: Xiu Jianfeng <xiujianfeng@huawei.com>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <viro@zeniv.linux.org.uk>, <brauner@kernel.org>, <dhowells@redhat.com>,
 <code@tyhicks.com>, <hirofumi@mail.parknet.co.jp>, <linkinjeon@kernel.org>,
 <sfrench@samba.org>, <senozhatsky@chromium.org>, <tom@talpey.com>,
 <chuck.lever@oracle.com>, <jlayton@kernel.org>, <miklos@szeredi.hu>,
 <paul@paul-moore.com>, <jmorris@namei.org>, <serge@hallyn.com>,
 <stephen.smalley.work@gmail.com>, <eparis@parisplace.org>,
 <casey@schaufler-ca.com>, <dchinner@redhat.com>,
 <john.johansen@canonical.com>, <mcgrof@kernel.org>, <mortonm@chromium.org>,
 <fred@cloudflare.com>, <mic@digikod.net>, <mpe@ellerman.id.au>,
 <nathanl@linux.ibm.com>, <gnoack3000@gmail.com>, <roberto.sassu@huawei.com>
Date: Fri, 5 May 2023 16:12:00 +0800
Message-ID: <20230505081200.254449-3-xiujianfeng@huawei.com>
In-Reply-To: <20230505081200.254449-1-xiujianfeng@huawei.com>
References: <20230505081200.254449-1-xiujianfeng@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mailman-Approved-At: Mon, 15 May 2023 10:25:24 +0000
Subject: [Linux-cachefs] [PATCH -next 2/2] lsm: Change inode_setattr hook to
 take struct path argument
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 selinux@vger.kernel.org, ecryptfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-unionfs@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-cachefs@redhat.com,
 wangweiyang2@huawei.com, linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For path-based LSMs such as Landlock, struct path instead of struct
dentry is required to make sense of attr/xattr accesses. So change the
argument of lsm hook inode_setattr() from struct dentry * to struct
path *.

Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
---
 fs/attr.c                     |  2 +-
 fs/fat/file.c                 |  2 +-
 include/linux/lsm_hook_defs.h |  2 +-
 include/linux/security.h      |  4 ++--
 security/security.c           | 10 +++++-----
 security/selinux/hooks.c      |  3 ++-
 security/smack/smack_lsm.c    |  5 +++--
 7 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/fs/attr.c b/fs/attr.c
index eecd78944b83..54d4334c350f 100644
--- a/fs/attr.c
+++ b/fs/attr.c
@@ -473,7 +473,7 @@ int notify_change(struct mnt_idmap *idmap, const struct path *path,
 	    !vfsgid_valid(i_gid_into_vfsgid(idmap, inode)))
 		return -EOVERFLOW;
 
-	error = security_inode_setattr(idmap, dentry, attr);
+	error = security_inode_setattr(idmap, path, attr);
 	if (error)
 		return error;
 	error = try_break_deleg(inode, delegated_inode);
diff --git a/fs/fat/file.c b/fs/fat/file.c
index 795a4fad5c40..bb31663f99b5 100644
--- a/fs/fat/file.c
+++ b/fs/fat/file.c
@@ -91,7 +91,7 @@ static int fat_ioctl_set_attributes(struct file *file, u32 __user *user_attr)
 	 * module, just because it maps to a file mode.
 	 */
 	err = security_inode_setattr(file_mnt_idmap(file),
-				     file->f_path.dentry, &ia);
+				     &file->f_path, &ia);
 	if (err)
 		goto out_unlock_inode;
 
diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index 6bb55e61e8e8..542fa6ab87c5 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -134,7 +134,7 @@ LSM_HOOK(int, 0, inode_readlink, struct dentry *dentry)
 LSM_HOOK(int, 0, inode_follow_link, struct dentry *dentry, struct inode *inode,
 	 bool rcu)
 LSM_HOOK(int, 0, inode_permission, struct inode *inode, int mask)
-LSM_HOOK(int, 0, inode_setattr, struct dentry *dentry, struct iattr *attr)
+LSM_HOOK(int, 0, inode_setattr, const struct path *path, struct iattr *attr)
 LSM_HOOK(int, 0, inode_getattr, const struct path *path)
 LSM_HOOK(int, 0, inode_setxattr, struct mnt_idmap *idmap,
 	 struct dentry *dentry, const char *name, const void *value,
diff --git a/include/linux/security.h b/include/linux/security.h
index e2734e9e44d5..9121f86feed1 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -353,7 +353,7 @@ int security_inode_follow_link(struct dentry *dentry, struct inode *inode,
 			       bool rcu);
 int security_inode_permission(struct inode *inode, int mask);
 int security_inode_setattr(struct mnt_idmap *idmap,
-			   struct dentry *dentry, struct iattr *attr);
+			   const struct path *path, struct iattr *attr);
 int security_inode_getattr(const struct path *path);
 int security_inode_setxattr(struct mnt_idmap *idmap,
 			    struct dentry *dentry, const char *name,
@@ -849,7 +849,7 @@ static inline int security_inode_permission(struct inode *inode, int mask)
 }
 
 static inline int security_inode_setattr(struct mnt_idmap *idmap,
-					 struct dentry *dentry,
+					 const struct path *path,
 					 struct iattr *attr)
 {
 	return 0;
diff --git a/security/security.c b/security/security.c
index d5ff7ff45b77..2ce7194fdb5c 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2075,7 +2075,7 @@ int security_inode_permission(struct inode *inode, int mask)
 /**
  * security_inode_setattr() - Check if setting file attributes is allowed
  * @idmap: idmap of the mount
- * @dentry: file
+ * @path: path of file
  * @attr: new attributes
  *
  * Check permission before setting file attributes.  Note that the kernel call
@@ -2086,16 +2086,16 @@ int security_inode_permission(struct inode *inode, int mask)
  * Return: Returns 0 if permission is granted.
  */
 int security_inode_setattr(struct mnt_idmap *idmap,
-			   struct dentry *dentry, struct iattr *attr)
+			   const struct path *path, struct iattr *attr)
 {
 	int ret;
 
-	if (unlikely(IS_PRIVATE(d_backing_inode(dentry))))
+	if (unlikely(IS_PRIVATE(d_backing_inode(path->dentry))))
 		return 0;
-	ret = call_int_hook(inode_setattr, 0, dentry, attr);
+	ret = call_int_hook(inode_setattr, 0, path, attr);
 	if (ret)
 		return ret;
-	return evm_inode_setattr(idmap, dentry, attr);
+	return evm_inode_setattr(idmap, path->dentry, attr);
 }
 EXPORT_SYMBOL_GPL(security_inode_setattr);
 
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index 79b4890e9936..81abaea4dd63 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -3051,9 +3051,10 @@ static int selinux_inode_permission(struct inode *inode, int mask)
 	return rc;
 }
 
-static int selinux_inode_setattr(struct dentry *dentry, struct iattr *iattr)
+static int selinux_inode_setattr(const struct path *path, struct iattr *iattr)
 {
 	const struct cred *cred = current_cred();
+	struct dentry *dentry = path->dentry;
 	struct inode *inode = d_backing_inode(dentry);
 	unsigned int ia_valid = iattr->ia_valid;
 	__u32 av = FILE__WRITE;
diff --git a/security/smack/smack_lsm.c b/security/smack/smack_lsm.c
index 7a3e9ab137d8..0b2931c87507 100644
--- a/security/smack/smack_lsm.c
+++ b/security/smack/smack_lsm.c
@@ -1147,14 +1147,15 @@ static int smack_inode_permission(struct inode *inode, int mask)
 
 /**
  * smack_inode_setattr - Smack check for setting attributes
- * @dentry: the object
+ * @path: path of the object
  * @iattr: for the force flag
  *
  * Returns 0 if access is permitted, an error code otherwise
  */
-static int smack_inode_setattr(struct dentry *dentry, struct iattr *iattr)
+static int smack_inode_setattr(const struct path *path, struct iattr *iattr)
 {
 	struct smk_audit_info ad;
+	struct dentry *dentry = path->dentry;
 	int rc;
 
 	/*
-- 
2.17.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

