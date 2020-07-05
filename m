Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 4A95A215A3E
	for <lists+linux-cachefs@lfdr.de>; Mon,  6 Jul 2020 17:02:44 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-p6qJdl2QMZSnj0_zGUEZlw-1; Mon, 06 Jul 2020 11:02:41 -0400
X-MC-Unique: p6qJdl2QMZSnj0_zGUEZlw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB07E8018AB;
	Mon,  6 Jul 2020 15:02:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 996D119D81;
	Mon,  6 Jul 2020 15:02:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7F0CB1809561;
	Mon,  6 Jul 2020 15:02:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 065ModR0007083 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sun, 5 Jul 2020 18:50:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A41E6207B455; Sun,  5 Jul 2020 22:50:38 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6808F207B43E
	for <linux-cachefs@redhat.com>; Sun,  5 Jul 2020 22:50:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7370B8EF3A4
	for <linux-cachefs@redhat.com>; Sun,  5 Jul 2020 22:50:35 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-93-kN0VmxpANoWCIQgqVs7Bhg-1;
	Sun, 05 Jul 2020 18:50:33 -0400
X-MC-Unique: kN0VmxpANoWCIQgqVs7Bhg-1
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 59d44869;
	Sun, 5 Jul 2020 22:23:23 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d5744d36
	(TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
	Sun, 5 Jul 2020 22:23:23 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: dhowells@redhat.com, linux-cachefs@redhat.com, linux-kernel@vger.kernel.org
Date: Sun,  5 Jul 2020 16:43:24 -0600
Message-Id: <20200705224324.16090-1-Jason@zx2c4.com>
MIME-Version: 1.0
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Mon, 06 Jul 2020 11:02:32 -0400
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: [Linux-cachefs] [PATCH] fscache: replace open-coded pr_warn_once()
	with actual call
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There's no reason to open code this here, so instead replace it with
pr_warn_once, which amounts to exactly the same thing.

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 fs/fscache/page.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/fs/fscache/page.c b/fs/fscache/page.c
index 26af6fdf1538..dc8dce79fa8d 100644
--- a/fs/fscache/page.c
+++ b/fs/fscache/page.c
@@ -1173,14 +1173,9 @@ void fscache_mark_page_cached(struct fscache_retrieval *op, struct page *page)
 	trace_fscache_page(cookie, page, fscache_page_cached);
 
 	_debug("- mark %p{%lx}", page, page->index);
-	if (TestSetPageFsCache(page)) {
-		static bool once_only;
-		if (!once_only) {
-			once_only = true;
-			pr_warn("Cookie type %s marked page %lx multiple times\n",
-				cookie->def->name, page->index);
-		}
-	}
+	if (TestSetPageFsCache(page))
+		pr_warn_once("Cookie type %s marked page %lx multiple times\n",
+			     cookie->def->name, page->index);
 
 	if (cookie->def->mark_page_cached)
 		cookie->def->mark_page_cached(cookie->netfs_data,
-- 
2.27.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

