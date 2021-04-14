Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id C132F35F3F8
	for <lists+linux-cachefs@lfdr.de>; Wed, 14 Apr 2021 14:39:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-JjNZbC-VMZGD5KLuXrjivA-1; Wed, 14 Apr 2021 08:39:11 -0400
X-MC-Unique: JjNZbC-VMZGD5KLuXrjivA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 402271020C22;
	Wed, 14 Apr 2021 12:39:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 312861899A;
	Wed, 14 Apr 2021 12:39:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 191231806D0E;
	Wed, 14 Apr 2021 12:39:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13ECd7Kj018120 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 14 Apr 2021 08:39:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1DA16114B9A5; Wed, 14 Apr 2021 12:39:07 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19976114B9A3
	for <linux-cachefs@redhat.com>; Wed, 14 Apr 2021 12:39:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9218585A5AA
	for <linux-cachefs@redhat.com>; Wed, 14 Apr 2021 12:39:04 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-527-XddldE72PBWkD5h6-HBGCw-1;
	Wed, 14 Apr 2021 08:39:01 -0400
X-MC-Unique: XddldE72PBWkD5h6-HBGCw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05A6961242;
	Wed, 14 Apr 2021 12:38:56 +0000 (UTC)
From: Christian Brauner <brauner@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 14 Apr 2021 14:37:51 +0200
Message-Id: <20210414123750.2110159-8-brauner@kernel.org>
In-Reply-To: <20210414123750.2110159-1-brauner@kernel.org>
References: <20210414123750.2110159-1-brauner@kernel.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=TJq3ADscBRuq3vVMRrZQ25nFLYThkfCmWR4OfInmRrw=;
	m=1ciTf4lEciTeOTFMYE8Ti/zNFh88dj9ns8fWVydD8Es=;
	p=z+y7HlsQCE+Knq6tGOyffFIPiZjVOof3onzoRF6Hb6E=;
	g=0d107768135058226d796803890d0dee0a0e7ec6
X-Patch-Sig: m=pgp; i=christian.brauner@ubuntu.com; s=0x0x91C61BC06578DCA2;
	b=iHUEABYKAB0WIQRAhzRXHqcMeLMyaSiRxhvAZXjcogUCYHbh4AAKCRCRxhvAZXjcotLBAQDn6l9
	aXkwGRy7SXgg32N2NRCvBm3ku22g55ZuZqsqPhwD/TYrdUDq3t7xICbXuJj/8/Y+oSbZh1gRpQ2li
	RXJyZgI=
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13ECd7Kj018120
X-loop: linux-cachefs@redhat.com
Cc: Miklos Szeredi <mszeredi@redhat.com>, ecryptfs@vger.kernel.org,
	Amir Goldstein <amir73il@gmail.com>,
	Tyler Hicks <code@tyhicks.com>, linux-cachefs@redhat.com,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <christian.brauner@ubuntu.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH 7/7] ecryptfs: extend ro check to private
	mount
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Christian Brauner <christian.brauner@ubuntu.com>

So far ecryptfs only verified that the superblock wasn't read-only but
didn't check whether the mount was. This made sense when we did not use
a private mount because the read-only state could change at any point.

Now that we have a private mount and mount properties can't change
behind our back extend the read-only check to include the vfsmount.

The __mnt_is_readonly() helper will check both the mount and the
superblock.  Note that before we checked root->d_sb and now we check
mnt->mnt_sb but since we have a matching <vfsmount, dentry> pair here
this is only syntactical change, not a semantic one.

Overlayfs and cachefiles have been changed to check this as well.

Cc: Amir Goldstein <amir73il@gmail.com>
Cc: Tyler Hicks <code@tyhicks.com>
Cc: ecryptfs@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 fs/ecryptfs/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ecryptfs/main.c b/fs/ecryptfs/main.c
index 3ba2c0f349a3..4e5aeec91e95 100644
--- a/fs/ecryptfs/main.c
+++ b/fs/ecryptfs/main.c
@@ -571,7 +571,7 @@ static struct dentry *ecryptfs_mount(struct file_system_type *fs_type, int flags
 	 *   1) The lower mount is ro
 	 *   2) The ecryptfs_encrypted_view mount option is specified
 	 */
-	if (sb_rdonly(path.dentry->d_sb) || mount_crypt_stat->flags & ECRYPTFS_ENCRYPTED_VIEW_ENABLED)
+	if (__mnt_is_readonly(mnt) || mount_crypt_stat->flags & ECRYPTFS_ENCRYPTED_VIEW_ENABLED)
 		s->s_flags |= SB_RDONLY;
 
 	s->s_maxbytes = path.dentry->d_sb->s_maxbytes;
-- 
2.27.0


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

