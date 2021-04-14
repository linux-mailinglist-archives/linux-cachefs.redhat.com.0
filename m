Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 84BDB35F3F2
	for <lists+linux-cachefs@lfdr.de>; Wed, 14 Apr 2021 14:38:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-QfhGVehsPDaafNTcu5-7qg-1; Wed, 14 Apr 2021 08:38:54 -0400
X-MC-Unique: QfhGVehsPDaafNTcu5-7qg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E63784B9A1;
	Wed, 14 Apr 2021 12:38:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B0D1E2EB;
	Wed, 14 Apr 2021 12:38:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4480144A5B;
	Wed, 14 Apr 2021 12:38:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13ECcmXr018029 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 14 Apr 2021 08:38:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 89012210FE1F; Wed, 14 Apr 2021 12:38:48 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8379D210FE24
	for <linux-cachefs@redhat.com>; Wed, 14 Apr 2021 12:38:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 744D8801E8D
	for <linux-cachefs@redhat.com>; Wed, 14 Apr 2021 12:38:45 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-112-3gzkaYtROzam8hiswzgz3Q-1;
	Wed, 14 Apr 2021 08:38:42 -0400
X-MC-Unique: 3gzkaYtROzam8hiswzgz3Q-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4BA83611B0;
	Wed, 14 Apr 2021 12:38:38 +0000 (UTC)
From: Christian Brauner <brauner@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 14 Apr 2021 14:37:46 +0200
Message-Id: <20210414123750.2110159-3-brauner@kernel.org>
In-Reply-To: <20210414123750.2110159-1-brauner@kernel.org>
References: <20210414123750.2110159-1-brauner@kernel.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=jBO34yTxB8bcJDNJq5wyTUQeL0/1ZCfYS2ZDxiTmIdE=;
	m=IiCeUIXZorhQEWHc615NYZk6WrnbxHgrkwHPs6aKB6E=;
	p=yfLKT3q8PN5tBMAd2IiBeetSQMKvFza+4gNsKpOHu3w=;
	g=0fda3c9759267fe5b2a619ffc64ace4696480ec8
X-Patch-Sig: m=pgp; i=christian.brauner@ubuntu.com; s=0x0x91C61BC06578DCA2;
	b=iHUEABYKAB0WIQRAhzRXHqcMeLMyaSiRxhvAZXjcogUCYHbh3wAKCRCRxhvAZXjcong/AP9hXfZ
	8QGHNXycaEHAq1UnQs/HQfdCYLk9erfJSyRxvrQD/S2GXC1LEKEP2hVXyl55xNJjAtBVkvQ3CMI+N
	LuYwFAc=
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13ECcmXr018029
X-loop: linux-cachefs@redhat.com
Cc: Miklos Szeredi <mszeredi@redhat.com>, ecryptfs@vger.kernel.org,
	Amir Goldstein <amir73il@gmail.com>,
	Tyler Hicks <code@tyhicks.com>, linux-cachefs@redhat.com,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <christian.brauner@ubuntu.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH 2/7] namespace: add kernel doc for
	mnt_clone_internal()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Christian Brauner <christian.brauner@ubuntu.com>

Document mnt_clone_internal().

Cc: Amir Goldstein <amir73il@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Miklos Szeredi <mszeredi@redhat.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 fs/namespace.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fs/namespace.c b/fs/namespace.c
index 02f415061efe..7ffefa8b3980 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -1271,6 +1271,22 @@ bool path_is_mountpoint(const struct path *path)
 }
 EXPORT_SYMBOL(path_is_mountpoint);
 
+/**
+ * mnt_clone_internal - create a private clone of a path
+ * @path: path from which the mnt to clone will be taken
+ *
+ * This creates a new vfsmount, which will be a clone of @path's vfsmount.
+ *
+ * In contrast to clone_private_mount() the new mount will be marked
+ * MNT_INTERNAL and will note have any mount namespace attached making it
+ * suitable for short-lived internal mounts since mntput()ing it will always
+ * hit the slowpath taking the mount lock.
+ *
+ * Since the mount is not reachable anwyhere mount properties and propagation
+ * properties remain stable, i.e. cannot change.
+ *
+ * Return: A clone of @path's vfsmount on success, an error pointer on failure.
+ */
 struct vfsmount *mnt_clone_internal(const struct path *path)
 {
 	struct mount *p;
-- 
2.27.0


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

