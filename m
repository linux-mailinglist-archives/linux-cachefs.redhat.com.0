Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1720C635865
	for <lists+linux-cachefs@lfdr.de>; Wed, 23 Nov 2022 10:57:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669197431;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7Ka1NbWXttHIn35HMFXurKW5lYYdGqF1uooSzPYz2cI=;
	b=NJjOHHqkOKzb7UmG5O4jzdndByUY8h0e5kvKPigCjaKvYt2tCt9+BkZrhMBNnC2EmsJj5w
	6Yj2H9aAdwCHFiSwZO+bUzQwisJKdGiKZe2kkl/QKwsJSSR9RkMd8bGfcV5u7TRrKjWrz7
	uONOO4GdkdbehnD0iDVvYHD8B3tiCR0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-SWNtiE0JPs6ABt8SBNFvKQ-1; Wed, 23 Nov 2022 04:57:08 -0500
X-MC-Unique: SWNtiE0JPs6ABt8SBNFvKQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A0E7803520;
	Wed, 23 Nov 2022 09:57:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 636C62166B26;
	Wed, 23 Nov 2022 09:57:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E2719194658D;
	Wed, 23 Nov 2022 09:57:05 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 870C41946587 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 23 Nov 2022 09:57:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 299084A9256; Wed, 23 Nov 2022 09:57:04 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22A4C4A9254
 for <linux-cachefs@redhat.com>; Wed, 23 Nov 2022 09:57:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07BAB802C17
 for <linux-cachefs@redhat.com>; Wed, 23 Nov 2022 09:57:04 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-FHVTlaDyOveqPpwpj9rTEg-1; Wed, 23 Nov 2022 04:57:02 -0500
X-MC-Unique: FHVTlaDyOveqPpwpj9rTEg-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B1D90B81E60;
 Wed, 23 Nov 2022 09:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 036EDC433D7;
 Wed, 23 Nov 2022 09:50:37 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Date: Wed, 23 Nov 2022 09:50:26 +0100
Message-Id: <20221123084633.777016204@linuxfoundation.org>
In-Reply-To: <20221123084625.457073469@linuxfoundation.org>
References: <20221123084625.457073469@linuxfoundation.org>
User-Agent: quilt/0.67
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [Linux-cachefs] [PATCH 6.0 181/314] netfs: Fix dodgy maths
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
Cc: Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeff Layton <jlayton@kernel.org>, patches@lists.linux.dev,
 Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org,
 linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: David Howells <dhowells@redhat.com>

[ Upstream commit 5e51c627c5acbcf82bb552e17533a79d2a6a2600 ]

Fix the dodgy maths in netfs_rreq_unlock_folios().  start_page could be
inside the folio, in which case the calculation of pgpos will be come up
with a negative number (though for the moment rreq->start is rounded down
earlier and folios would have to get merged whilst locked)

Alter how this works to just frame the tracking in terms of absolute file
positions, rather than offsets from the start of the I/O request.  This
simplifies the maths and makes it easier to follow.

Fix the issue by using folio_pos() and folio_size() to calculate the end
position of the page.

Fixes: 3d3c95046742 ("netfs: Provide readahead and readpage netfs helpers")
Reported-by: Matthew Wilcox <willy@infradead.org>
Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jeff Layton <jlayton@kernel.org>
Reviewed-by: Jingbo Xu <jefflexu@linux.alibaba.com>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
Link: https://lore.kernel.org/r/Y2SJw7w1IsIik3nb@casper.infradead.org/
Link: https://lore.kernel.org/r/166757988611.950645.7626959069846893164.stgit@warthog.procyon.org.uk/ # v2
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/netfs/buffered_read.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index baf668fb4315..7679a68e8193 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -17,9 +17,9 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
 {
 	struct netfs_io_subrequest *subreq;
 	struct folio *folio;
-	unsigned int iopos, account = 0;
 	pgoff_t start_page = rreq->start / PAGE_SIZE;
 	pgoff_t last_page = ((rreq->start + rreq->len) / PAGE_SIZE) - 1;
+	size_t account = 0;
 	bool subreq_failed = false;
 
 	XA_STATE(xas, &rreq->mapping->i_pages, start_page);
@@ -39,23 +39,23 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
 	 */
 	subreq = list_first_entry(&rreq->subrequests,
 				  struct netfs_io_subrequest, rreq_link);
-	iopos = 0;
 	subreq_failed = (subreq->error < 0);
 
 	trace_netfs_rreq(rreq, netfs_rreq_trace_unlock);
 
 	rcu_read_lock();
 	xas_for_each(&xas, folio, last_page) {
-		unsigned int pgpos, pgend;
+		loff_t pg_end;
 		bool pg_failed = false;
 
 		if (xas_retry(&xas, folio))
 			continue;
 
-		pgpos = (folio_index(folio) - start_page) * PAGE_SIZE;
-		pgend = pgpos + folio_size(folio);
+		pg_end = folio_pos(folio) + folio_size(folio) - 1;
 
 		for (;;) {
+			loff_t sreq_end;
+
 			if (!subreq) {
 				pg_failed = true;
 				break;
@@ -63,11 +63,11 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
 			if (test_bit(NETFS_SREQ_COPY_TO_CACHE, &subreq->flags))
 				folio_start_fscache(folio);
 			pg_failed |= subreq_failed;
-			if (pgend < iopos + subreq->len)
+			sreq_end = subreq->start + subreq->len - 1;
+			if (pg_end < sreq_end)
 				break;
 
 			account += subreq->transferred;
-			iopos += subreq->len;
 			if (!list_is_last(&subreq->rreq_link, &rreq->subrequests)) {
 				subreq = list_next_entry(subreq, rreq_link);
 				subreq_failed = (subreq->error < 0);
@@ -75,7 +75,8 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq)
 				subreq = NULL;
 				subreq_failed = false;
 			}
-			if (pgend == iopos)
+
+			if (pg_end == sreq_end)
 				break;
 		}
 
-- 
2.35.1



--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

