Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2118F35F3F3
	for <lists+linux-cachefs@lfdr.de>; Wed, 14 Apr 2021 14:39:02 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-Q3dMPy3oMdS-tS_l8AVUpQ-1; Wed, 14 Apr 2021 08:38:59 -0400
X-MC-Unique: Q3dMPy3oMdS-tS_l8AVUpQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FCCE814339;
	Wed, 14 Apr 2021 12:38:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B4E3607D5;
	Wed, 14 Apr 2021 12:38:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F0DD644A5B;
	Wed, 14 Apr 2021 12:38:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13ECcpi6018049 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 14 Apr 2021 08:38:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 53D90114B9A9; Wed, 14 Apr 2021 12:38:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F964114B9A7
	for <linux-cachefs@redhat.com>; Wed, 14 Apr 2021 12:38:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED3FD8001A6
	for <linux-cachefs@redhat.com>; Wed, 14 Apr 2021 12:38:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-329-L9Bpwb3UND62llBItTHR9g-1;
	Wed, 14 Apr 2021 08:38:39 -0400
X-MC-Unique: L9Bpwb3UND62llBItTHR9g-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id E852761158;
	Wed, 14 Apr 2021 12:38:34 +0000 (UTC)
From: Christian Brauner <brauner@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 14 Apr 2021 14:37:45 +0200
Message-Id: <20210414123750.2110159-2-brauner@kernel.org>
In-Reply-To: <20210414123750.2110159-1-brauner@kernel.org>
References: <20210414123750.2110159-1-brauner@kernel.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; i=Ug070dnCYtvoTTL9sM+KCsYvFzZzgfpQ1rAeZsa4E0c=;
	m=Nyy5JV6keYRz9DaoVlPSewQmP7/guf8xde0k24FEh8I=;
	p=Ez0P8VpCpQt2UopiUYXdmn61d6ikUXWbnh4YqIFsC/g=;
	g=e2958c68e45ab891ebc18d84945f46ea030fd186
X-Patch-Sig: m=pgp; i=christian.brauner@ubuntu.com; s=0x0x91C61BC06578DCA2;
	b=iHUEABYKAB0WIQRAhzRXHqcMeLMyaSiRxhvAZXjcogUCYHbh3wAKCRCRxhvAZXjcoufWAP9xjcj
	8M8rEHzBJtuKW2qoVv2jPFVwHN8aJICtFeGnOWQEAlTvTfEAfp8jjIc53K83adZs9p6OiZMZJhrA/
	5TLbaw4=
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 13ECcpi6018049
X-loop: linux-cachefs@redhat.com
Cc: Miklos Szeredi <mszeredi@redhat.com>, ecryptfs@vger.kernel.org,
	Amir Goldstein <amir73il@gmail.com>,
	Tyler Hicks <code@tyhicks.com>, linux-cachefs@redhat.com,
	Al Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <christian.brauner@ubuntu.com>,
	Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH 1/7] namespace: fix clone_private_mount()
	kernel doc
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

From: Christian Brauner <christian.brauner@ubuntu.com>

Extend the kernel documentation for clone_private_mount(). Add some more
detailed info about its usage and convert it into proper kernel doc.

Cc: Amir Goldstein <amir73il@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Miklos Szeredi <mszeredi@redhat.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
Signed-off-by: Christian Brauner <christian.brauner@ubuntu.com>
---
 fs/namespace.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/fs/namespace.c b/fs/namespace.c
index 56bb5a5fdc0d..02f415061efe 100644
--- a/fs/namespace.c
+++ b/fs/namespace.c
@@ -1939,12 +1939,21 @@ void drop_collected_mounts(struct vfsmount *mnt)
 
 /**
  * clone_private_mount - create a private clone of a path
+ * @path: path from which the mnt to clone will be taken
  *
- * This creates a new vfsmount, which will be the clone of @path.  The new will
- * not be attached anywhere in the namespace and will be private (i.e. changes
- * to the originating mount won't be propagated into this).
+ * This creates a new vfsmount, which will be a clone of @path's vfsmount.
  *
- * Release with mntput().
+ * In contrast to mnt_clone_internal() the new mount will not be marked
+ * MNT_INTERNAL but will have MNT_NS_INTERNAL attached as its mount namespace
+ * making it suitable for long-term mounts since mntput()ing it will always hit
+ * the fastpath as long as kern_unmount() hasn't been called.
+ *
+ * Since the mount is not reachable anwyhere mount properties and propagation
+ * properties remain stable, i.e. cannot change.
+ *
+ * Useable with mntget()/mntput() but needs to be released with kern_unmount().
+ *
+ * Return: A clone of @path's vfsmount on success, an error pointer on failure.
  */
 struct vfsmount *clone_private_mount(const struct path *path)
 {
-- 
2.27.0


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

