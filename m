Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E82A936942A
	for <lists+linux-cachefs@lfdr.de>; Fri, 23 Apr 2021 15:56:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619186166;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cigi2HFcStwfjIKJvz4HT4/kF8Snol/MgXa1GoWaMK0=;
	b=J0EUtXjLmvh/sCDWmeN0u8QhqowQk9FXJ3Qr54Wq+uZ/PQQ5T181dUO1v2YG/MO+B0p0Fn
	lUlXG+UhH6Zbjw/TUfbIYElYiHmmowqRRVqmhT9dD0FrUhFX5oO4eNYdrY3JloQgoDfVfd
	kIo/Xgsszxl1+2/422dU++kPEsJemks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-40F0Ivb0Oxmm3oN0TRyd9w-1; Fri, 23 Apr 2021 09:56:03 -0400
X-MC-Unique: 40F0Ivb0Oxmm3oN0TRyd9w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15CF964165;
	Fri, 23 Apr 2021 13:56:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F061160613;
	Fri, 23 Apr 2021 13:55:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA88C44A5D;
	Fri, 23 Apr 2021 13:55:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13NDSusq022643 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 23 Apr 2021 09:28:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 020BFBA63; Fri, 23 Apr 2021 13:28:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-124.rdu2.redhat.com
	[10.10.112.124])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 83D0F60C13;
	Fri, 23 Apr 2021 13:28:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-fsdevel@vger.kernel.org
Date: Fri, 23 Apr 2021 14:28:51 +0100
Message-ID: <161918453173.3145707.484012520187142542.stgit@warthog.procyon.org.uk>
In-Reply-To: <161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
References: <161918446704.3145707.14418606303992174310.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 23 Apr 2021 09:55:53 -0400
Cc: Steve French <sfrench@samba.org>, linux-nfs@vger.kernel.org,
	linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-mm@kvack.org,
	linux-cachefs@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Subject: [Linux-cachefs] [PATCH v7 05/31] mm/readahead: Handle ractl
	nr_pages being modified
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

From: Matthew Wilcox (Oracle) <willy@infradead.org>

Filesystems are not currently permitted to modify the number of pages
in the ractl.  An upcoming patch to add readahead_expand() changes that
rule, so remove the check and resync the loop counter after every call
to the filesystem.

Tested-by: Jeff Layton <jlayton@kernel.org>
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: David Howells <dhowells@redhat.com>
Link: https://lore.kernel.org/r/20210420200116.3715790-1-willy@infradead.org/
Link: https://lore.kernel.org/r/20210421170923.4005574-1-willy@infradead.org/ # v2
---

 mm/readahead.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/readahead.c b/mm/readahead.c
index 2088569a947e..5b423ecc99f1 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -198,8 +198,6 @@ void page_cache_ra_unbounded(struct readahead_control *ractl,
 	for (i = 0; i < nr_to_read; i++) {
 		struct page *page = xa_load(&mapping->i_pages, index + i);
 
-		BUG_ON(index + i != ractl->_index + ractl->_nr_pages);
-
 		if (page && !xa_is_value(page)) {
 			/*
 			 * Page already present?  Kick off the current batch
@@ -210,6 +208,7 @@ void page_cache_ra_unbounded(struct readahead_control *ractl,
 			 * not worth getting one just for that.
 			 */
 			read_pages(ractl, &page_pool, true);
+			i = ractl->_index + ractl->_nr_pages - index - 1;
 			continue;
 		}
 
@@ -223,6 +222,7 @@ void page_cache_ra_unbounded(struct readahead_control *ractl,
 					gfp_mask) < 0) {
 			put_page(page);
 			read_pages(ractl, &page_pool, true);
+			i = ractl->_index + ractl->_nr_pages - index - 1;
 			continue;
 		}
 		if (i == nr_to_read - lookahead_size)


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

