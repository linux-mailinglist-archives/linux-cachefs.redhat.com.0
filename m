Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 51558345D60
	for <lists+linux-cachefs@lfdr.de>; Tue, 23 Mar 2021 12:53:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616500438;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZgrrlmvmByd6WBTFMVPzwZvMVHrnUYKGJVIprjK/PKA=;
	b=LandlHB6G23Xuu62Yci4ooxvPKI5kJdQHuXPgv/+yWH8UjaPBCECy94i9as7xdbxKA9FH1
	dStnInGWSmCO9LjAxIgsWePTA4RYPCMeF+ekaWspqoGdqXV2J5gFSudosPXuve4MNFf1RN
	v1hCVZfjsU7XPclkHthTq3igX0cgwZs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-LHMdG-CONpyBD3_cwU03AA-1; Tue, 23 Mar 2021 07:53:56 -0400
X-MC-Unique: LHMdG-CONpyBD3_cwU03AA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7598581626;
	Tue, 23 Mar 2021 11:53:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 624225D9C0;
	Tue, 23 Mar 2021 11:53:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B50A81809C83;
	Tue, 23 Mar 2021 11:53:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12NBrqD8025421 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 23 Mar 2021 07:53:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 292321002D71; Tue, 23 Mar 2021 11:53:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-112-58.rdu2.redhat.com
	[10.10.112.58])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BCC081001281;
	Tue, 23 Mar 2021 11:53:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: linux-cachefs@redhat.com, linux-afs@lists.infradead.org
Date: Tue, 23 Mar 2021 11:53:47 +0000
Message-ID: <161650042701.2445805.12535282100365692426.stgit@warthog.procyon.org.uk>
In-Reply-To: <161650040278.2445805.7652115256944270457.stgit@warthog.procyon.org.uk>
References: <161650040278.2445805.7652115256944270457.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: linux-cachefs@redhat.com
Cc: linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: [Linux-cachefs] [PATCH 2/3] mm/writeback: Add
	wait_on_page_writeback_killable
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

From: Matthew Wilcox (Oracle) <willy@infradead.org>

This is the killable version of wait_on_page_writeback.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: linux-afs@lists.infradead.org
cc: linux-mm@kvack.org
Link: https://lore.kernel.org/r/20210320054104.1300774-3-willy@infradead.org
---

 include/linux/pagemap.h |    1 +
 mm/page-writeback.c     |   16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 8f4daac6eb4b..8c9947fd62f3 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -682,6 +682,7 @@ static inline int wait_on_page_locked_killable(struct page *page)
 
 int put_and_wait_on_page_locked(struct page *page, int state);
 void wait_on_page_writeback(struct page *page);
+int wait_on_page_writeback_killable(struct page *page);
 extern void end_page_writeback(struct page *page);
 void wait_for_stable_page(struct page *page);
 
diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index eb34d204d4ee..9e35b636a393 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -2833,6 +2833,22 @@ void wait_on_page_writeback(struct page *page)
 }
 EXPORT_SYMBOL_GPL(wait_on_page_writeback);
 
+/*
+ * Wait for a page to complete writeback.  Returns -EINTR if we get a
+ * fatal signal while waiting.
+ */
+int wait_on_page_writeback_killable(struct page *page)
+{
+	while (PageWriteback(page)) {
+		trace_wait_on_page_writeback(page, page_mapping(page));
+		if (wait_on_page_bit_killable(page, PG_writeback))
+			return -EINTR;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(wait_on_page_writeback_killable);
+
 /**
  * wait_for_stable_page() - wait for writeback to finish, if necessary.
  * @page:	The page to wait on.


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

