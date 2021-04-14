Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7709F35F3F5
	for <lists+linux-cachefs@lfdr.de>; Wed, 14 Apr 2021 14:39:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-kOQzli-ZO_-RNrT6eIBqsw-1; Wed, 14 Apr 2021 08:39:00 -0400
X-MC-Unique: kOQzli-ZO_-RNrT6eIBqsw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86FB084B9A1;
	Wed, 14 Apr 2021 12:38:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70D206F969;
	Wed, 14 Apr 2021 12:38:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5823A44A5B;
	Wed, 14 Apr 2021 12:38:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13ECcqZq018054 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 14 Apr 2021 08:38:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B12082102FC2; Wed, 14 Apr 2021 12:38:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9EF72102FD2
	for <linux-cachefs@redhat.com>; Wed, 14 Apr 2021 12:38:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C636F101A52C
	for <linux-cachefs@redhat.com>; Wed, 14 Apr 2021 12:38:49 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-555-Tqi5pJO8MPWj2uUcM78YQA-1;
	Wed, 14 Apr 2021 08:38:47 -0400
X-MC-Unique: Tqi5pJO8MPWj2uUcM78YQA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D01960FED;
	Wed, 14 Apr 2021 12:38:41 +0000 (UTC)
From: Christian Brauner <brauner@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 14 Apr 2021 14:37:47 +0200
Message-Id: <20210414123750.2110159-4-brauner@kernel.org>
In-Reply-To: <20210414123750.2110159-1-brauner@kernel.org>
References: <20210414123750.2110159-1-brauner@kernel.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=QhpZF+pXGA2C35UZEcASpoPOekySoXvzF+VucE2h6UQ=;
	m=nUiY/Hyk9O3NEoy5nBMQg8mS6mXzVIt1wOdmvUcTRF8=;
	p=qKMfjPFs6+zUvX3s+RUCVFdWmJzx6xWhQ/tbOsngNSM=;
	g=6136b4f118bef21a7753d80f6c1d7b9bfbceb86a
X-Patch-Sig: m=pgp; i=christian.brauner@ubuntu.com; s=0x0x91C61BC06578DCA2;
	b=iHUEABYKAB0WIQRAhzRXHqcMeLMyaSiRxhvAZXjcogUCYHbh3wAKCRCRxhvAZXjcorREAQD9J6K
	JHiA/HQfrmEEyPA6l+rDET5u0b/PHbnIdB6gYFwEAjdbYoTfRQMkHc57c+Ps4V0mXtYStC3s/ygfS
	6zj+ags=
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13ECcqZq018054
X-loop: linux-cachefs@redhat.com
Cc: Miklos Szeredi <mszeredi@redhat.com>, ecryptfs@vger.kernel.org,
	Amir Goldstein <amir73il@gmail.com>,
	Tyler Hicks <code@tyhicks.com>, linux-cachefs@redhat.com,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <christian.brauner@ubuntu.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH 3/7] namespace: move unbindable check out of
	clone_private_mount()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Christian Brauner <christian.brauner@ubuntu.com>

We're about to switch all filesystems that stack on top or otherwise use
a struct path of another filesystem to use clone_private_mount() in the
following commits. Most of these filesystems like ecryptfs and
cachefiles don't need the MS_UNBDINDABLE check that overlayfs currently
wants. So move the check out of clone_private_mount() and into overlayfs
itself.

Note that overlayfs can probably be switched to not rely on the
MS_UNBDINDABLE check too but for now keep it.

[1]: df820f8de4e4 ("ovl: make private mounts longterm")
Cc: Amir Goldstein <amir73il@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Miklos Szeredi <mszeredi@redhat.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 fs/namespace.c       |  3 ---
 fs/overlayfs/super.c | 13 +++++++++++--
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index 7ffefa8b3980..f6efe1272b9d 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -1976,9 +1976,6 @@ struct vfsmount *clone_private_mount(const struct path *path)
 	struct mount *old_mnt = real_mount(path->mnt);
 	struct mount *new_mnt;
 
-	if (IS_MNT_UNBINDABLE(old_mnt))
-		return ERR_PTR(-EINVAL);
-
 	new_mnt = clone_mnt(old_mnt, path->dentry, CL_PRIVATE);
 	if (IS_ERR(new_mnt))
 		return ERR_CAST(new_mnt);
diff --git a/fs/overlayfs/super.c b/fs/overlayfs/super.c
index fdd72f1a9c5e..c942bb1073f6 100644
--- a/fs/overlayfs/super.c
+++ b/fs/overlayfs/super.c
@@ -15,6 +15,7 @@
 #include <linux/seq_file.h>
 #include <linux/posix_acl_xattr.h>
 #include <linux/exportfs.h>
+#include "../pnode.h"
 #include "overlayfs.h"
 
 MODULE_AUTHOR("Miklos Szeredi <miklos@szeredi.hu>");
@@ -1175,6 +1176,14 @@ static int ovl_report_in_use(struct ovl_fs *ofs, const char *name)
 	}
 }
 
+static inline struct vfsmount *ovl_clone_private_mount(const struct path *path)
+{
+	if (IS_MNT_UNBINDABLE(real_mount(path->mnt)))
+		return ERR_PTR(-EINVAL);
+
+	return clone_private_mount(path);
+}
+
 static int ovl_get_upper(struct super_block *sb, struct ovl_fs *ofs,
 			 struct ovl_layer *upper_layer, struct path *upperpath)
 {
@@ -1201,7 +1210,7 @@ static int ovl_get_upper(struct super_block *sb, struct ovl_fs *ofs,
 	if (err)
 		goto out;
 
-	upper_mnt = clone_private_mount(upperpath);
+	upper_mnt = ovl_clone_private_mount(upperpath);
 	err = PTR_ERR(upper_mnt);
 	if (IS_ERR(upper_mnt)) {
 		pr_err("failed to clone upperpath\n");
@@ -1700,7 +1709,7 @@ static int ovl_get_layers(struct super_block *sb, struct ovl_fs *ofs,
 			}
 		}
 
-		mnt = clone_private_mount(&stack[i]);
+		mnt = ovl_clone_private_mount(&stack[i]);
 		err = PTR_ERR(mnt);
 		if (IS_ERR(mnt)) {
 			pr_err("failed to clone lowerpath\n");
-- 
2.27.0


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

