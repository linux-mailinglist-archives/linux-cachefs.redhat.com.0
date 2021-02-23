Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 36079322B1E
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Feb 2021 14:07:33 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-S1xBhllxNbq4OQl5eohCJg-1; Tue, 23 Feb 2021 08:07:30 -0500
X-MC-Unique: S1xBhllxNbq4OQl5eohCJg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DAEA7801975;
	Tue, 23 Feb 2021 13:07:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAEF85C290;
	Tue, 23 Feb 2021 13:07:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B483358074;
	Tue, 23 Feb 2021 13:07:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11ND6h6d010511 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 23 Feb 2021 08:06:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1CF32114B2EA; Tue, 23 Feb 2021 13:06:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 18048114B2E7
	for <linux-cachefs@redhat.com>; Tue, 23 Feb 2021 13:06:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3005858EEB
	for <linux-cachefs@redhat.com>; Tue, 23 Feb 2021 13:06:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-589-HeMlsE-9OtqHJnwWcsLt4Q-1;
	Tue, 23 Feb 2021 08:06:35 -0500
X-MC-Unique: HeMlsE-9OtqHJnwWcsLt4Q-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5767164E2E;
	Tue, 23 Feb 2021 13:06:33 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: ceph-devel@vger.kernel.org
Date: Tue, 23 Feb 2021 08:06:25 -0500
Message-Id: <20210223130629.249546-3-jlayton@kernel.org>
In-Reply-To: <20210223130629.249546-1-jlayton@kernel.org>
References: <20210223130629.249546-1-jlayton@kernel.org>
MIME-Version: 1.0
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11ND6h6d010511
X-loop: linux-cachefs@redhat.com
Cc: willy@infradead.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, idryomov@gmail.com
Subject: [Linux-cachefs] [PATCH v3 2/6] ceph: rework PageFsCache handling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

With the new fscache API, the PageFsCache bit now indicates that the
page is being written to the cache and shouldn't be modified or released
until it's finished.

Change releasepage and invalidatepage to wait on that bit before
returning.

Also define FSCACHE_USE_NEW_IO_API so that we opt into the new fscache
API.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
Cc: ceph-devel@vger.kernel.org
Cc: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org
---
 fs/ceph/addr.c  | 9 ++++++++-
 fs/ceph/super.h | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index e267aa60c8b6..3936ae3e8dcd 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -146,6 +146,8 @@ static void ceph_invalidatepage(struct page *page, unsigned int offset,
 	struct ceph_inode_info *ci;
 	struct ceph_snap_context *snapc = page_snap_context(page);
 
+	wait_on_page_fscache(page);
+
 	inode = page->mapping->host;
 	ci = ceph_inode(inode);
 
@@ -168,11 +170,16 @@ static void ceph_invalidatepage(struct page *page, unsigned int offset,
 	ClearPagePrivate(page);
 }
 
-static int ceph_releasepage(struct page *page, gfp_t g)
+static int ceph_releasepage(struct page *page, gfp_t gfp)
 {
 	dout("%p releasepage %p idx %lu (%sdirty)\n", page->mapping->host,
 	     page, page->index, PageDirty(page) ? "" : "not ");
 
+	if (PageFsCache(page)) {
+		if (!(gfp & __GFP_DIRECT_RECLAIM) || !(gfp & __GFP_FS))
+			return 0;
+		wait_on_page_fscache(page);
+	}
 	return !PagePrivate(page);
 }
 
diff --git a/fs/ceph/super.h b/fs/ceph/super.h
index 060c93df9b93..2f7e769290c4 100644
--- a/fs/ceph/super.h
+++ b/fs/ceph/super.h
@@ -21,6 +21,7 @@
 #include <linux/ceph/libceph.h>
 
 #ifdef CONFIG_CEPH_FSCACHE
+#define FSCACHE_USE_NEW_IO_API
 #include <linux/fscache.h>
 #endif
 
-- 
2.29.2


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

