Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4D5F140F979
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Sep 2021 15:44:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-yL29xOa_OLGFndySyp2VTQ-1; Fri, 17 Sep 2021 09:44:12 -0400
X-MC-Unique: yL29xOa_OLGFndySyp2VTQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCBAD1084683;
	Fri, 17 Sep 2021 13:44:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95E3D1972E;
	Fri, 17 Sep 2021 13:44:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 75D4B4EA2A;
	Fri, 17 Sep 2021 13:44:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18HDi2Mu014739 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 17 Sep 2021 09:44:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AE8B644054; Fri, 17 Sep 2021 13:44:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A903A2D453
	for <linux-cachefs@redhat.com>; Fri, 17 Sep 2021 13:44:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 008058001EA
	for <linux-cachefs@redhat.com>; Fri, 17 Sep 2021 13:44:00 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-580-QQ4AXEtbPSKs3n7kcY-MmA-1;
	Fri, 17 Sep 2021 09:43:56 -0400
X-MC-Unique: QQ4AXEtbPSKs3n7kcY-MmA-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id ABB746113A;
	Fri, 17 Sep 2021 13:43:54 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org
Date: Fri, 17 Sep 2021 09:43:53 -0400
Message-Id: <20210917134353.138782-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
Cc: idryomov@gmail.com, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH] ceph: just use ci->i_version for fscache
	aux info
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

If the i_version regresses, then it's likely that the mtime will do the
same in lockstep with it. There's no need to track both here, just use
the i_version counter since it's just as good and gets the aux size down
to 64 bits.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/cache.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/fs/ceph/cache.c b/fs/ceph/cache.c
index 9cfadbb86568..457afda5498a 100644
--- a/fs/ceph/cache.c
+++ b/fs/ceph/cache.c
@@ -12,12 +12,6 @@
 #include "super.h"
 #include "cache.h"
 
-struct ceph_aux_inode {
-	u64 	version;
-	u64	mtime_sec;
-	u64	mtime_nsec;
-};
-
 struct fscache_netfs ceph_cache_netfs = {
 	.name		= "ceph",
 	.version	= 0,
@@ -109,20 +103,14 @@ static enum fscache_checkaux ceph_fscache_inode_check_aux(
 	void *cookie_netfs_data, const void *data, uint16_t dlen,
 	loff_t object_size)
 {
-	struct ceph_aux_inode aux;
 	struct ceph_inode_info* ci = cookie_netfs_data;
 	struct inode* inode = &ci->vfs_inode;
 
-	if (dlen != sizeof(aux) ||
+	if (dlen != sizeof(ci->i_version) ||
 	    i_size_read(inode) != object_size)
 		return FSCACHE_CHECKAUX_OBSOLETE;
 
-	memset(&aux, 0, sizeof(aux));
-	aux.version = ci->i_version;
-	aux.mtime_sec = inode->i_mtime.tv_sec;
-	aux.mtime_nsec = inode->i_mtime.tv_nsec;
-
-	if (memcmp(data, &aux, sizeof(aux)) != 0)
+	if (*(u64 *)data != ci->i_version)
 		return FSCACHE_CHECKAUX_OBSOLETE;
 
 	dout("ceph inode 0x%p cached okay\n", ci);
@@ -139,7 +127,6 @@ void ceph_fscache_register_inode_cookie(struct inode *inode)
 {
 	struct ceph_inode_info *ci = ceph_inode(inode);
 	struct ceph_fs_client *fsc = ceph_inode_to_client(inode);
-	struct ceph_aux_inode aux;
 
 	/* No caching for filesystem */
 	if (!fsc->fscache)
@@ -151,14 +138,10 @@ void ceph_fscache_register_inode_cookie(struct inode *inode)
 
 	inode_lock_nested(inode, I_MUTEX_CHILD);
 	if (!ci->fscache) {
-		memset(&aux, 0, sizeof(aux));
-		aux.version = ci->i_version;
-		aux.mtime_sec = inode->i_mtime.tv_sec;
-		aux.mtime_nsec = inode->i_mtime.tv_nsec;
 		ci->fscache = fscache_acquire_cookie(fsc->fscache,
 						     &ceph_fscache_inode_object_def,
 						     &ci->i_vino, sizeof(ci->i_vino),
-						     &aux, sizeof(aux),
+						     &ci->i_version, sizeof(ci->i_version),
 						     ci, i_size_read(inode), false);
 	}
 	inode_unlock(inode);
-- 
2.31.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

