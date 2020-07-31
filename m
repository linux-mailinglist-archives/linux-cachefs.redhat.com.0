Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A1434234676
	for <lists+linux-cachefs@lfdr.de>; Fri, 31 Jul 2020 15:04:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-nFsmcwfHO36cjBtWRXQifQ-1; Fri, 31 Jul 2020 09:04:41 -0400
X-MC-Unique: nFsmcwfHO36cjBtWRXQifQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B441710059AC;
	Fri, 31 Jul 2020 13:04:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4DDA7C106;
	Fri, 31 Jul 2020 13:04:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9206695A80;
	Fri, 31 Jul 2020 13:04:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06VD4bfQ009978 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 31 Jul 2020 09:04:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A5CE0110F747; Fri, 31 Jul 2020 13:04:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50169110F73E
	for <linux-cachefs@redhat.com>; Fri, 31 Jul 2020 13:04:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D713857FB1
	for <linux-cachefs@redhat.com>; Fri, 31 Jul 2020 13:04:28 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-182-6vD8a_-7Nam8xM43Z7EINg-1;
	Fri, 31 Jul 2020 09:04:25 -0400
X-MC-Unique: 6vD8a_-7Nam8xM43Z7EINg-1
Received: from tleilax.com (68-20-15-154.lightspeed.rlghnc.sbcglobal.net
	[68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 079B622B40;
	Fri, 31 Jul 2020 13:04:23 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org
Date: Fri, 31 Jul 2020 09:04:12 -0400
Message-Id: <20200731130421.127022-3-jlayton@kernel.org>
In-Reply-To: <20200731130421.127022-1-jlayton@kernel.org>
References: <20200731130421.127022-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06VD4bfQ009978
X-loop: linux-cachefs@redhat.com
Cc: idryomov@gmail.com, linux-cachefs@redhat.com
Subject: [Linux-cachefs] [RFC PATCH v2 02/11] ceph: don't call
	ceph_update_writeable_page from page_mkwrite
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

page_mkwrite should only be called with Uptodate pages, so we should
only need to flush incompatible snap contexts.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ceph/addr.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index d8a8803f0e65..e02d8915376f 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -1692,6 +1692,8 @@ static vm_fault_t ceph_page_mkwrite(struct vm_fault *vmf)
 	inode_inc_iversion_raw(inode);
 
 	do {
+		struct ceph_snap_context *snapc;
+
 		lock_page(page);
 
 		if (page_mkwrite_check_truncate(page, inode) < 0) {
@@ -1700,13 +1702,26 @@ static vm_fault_t ceph_page_mkwrite(struct vm_fault *vmf)
 			break;
 		}
 
-		err = ceph_update_writeable_page(vma->vm_file, off, len, page);
-		if (err >= 0) {
+		snapc = ceph_find_incompatible(inode, page);
+		if (!snapc) {
 			/* success.  we'll keep the page locked. */
 			set_page_dirty(page);
 			ret = VM_FAULT_LOCKED;
+			break;
 		}
-	} while (err == -EAGAIN);
+
+		unlock_page(page);
+
+		if (IS_ERR(snapc)) {
+			ret = VM_FAULT_SIGBUS;
+			break;
+		}
+
+		ceph_queue_writeback(inode);
+		err = wait_event_killable(ci->i_cap_wq,
+				context_is_writeable_or_written(inode, snapc));
+		ceph_put_snap_context(snapc);
+	} while (err == 0);
 
 	if (ret == VM_FAULT_LOCKED ||
 	    ci->i_inline_version != CEPH_INLINE_NONE) {
-- 
2.26.2


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

