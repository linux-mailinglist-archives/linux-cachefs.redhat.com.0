Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id B7ECF3506DD
	for <lists+linux-cachefs@lfdr.de>; Wed, 31 Mar 2021 20:53:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-OvBYeJ_gM3C-FZAyQNS57Q-1; Wed, 31 Mar 2021 14:53:47 -0400
X-MC-Unique: OvBYeJ_gM3C-FZAyQNS57Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D92283DD20;
	Wed, 31 Mar 2021 18:53:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C78B7669F3;
	Wed, 31 Mar 2021 18:53:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D31A4BB7B;
	Wed, 31 Mar 2021 18:53:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12VIrfDw004333 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 31 Mar 2021 14:53:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8B2B6C77D0; Wed, 31 Mar 2021 18:53:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85809C2309
	for <linux-cachefs@redhat.com>; Wed, 31 Mar 2021 18:53:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEA3D85A5BB
	for <linux-cachefs@redhat.com>; Wed, 31 Mar 2021 18:53:38 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-518-KFCCg0xqMAeAK6i_4tIZbg-1; Wed, 31 Mar 2021 14:53:36 -0400
X-MC-Unique: KFCCg0xqMAeAK6i_4tIZbg-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lRfx7-004zYl-H7; Wed, 31 Mar 2021 18:52:44 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org
Date: Wed, 31 Mar 2021 19:47:15 +0100
Message-Id: <20210331184728.1188084-15-willy@infradead.org>
In-Reply-To: <20210331184728.1188084-1-willy@infradead.org>
References: <20210331184728.1188084-1-willy@infradead.org>
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
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH v6 14/27] mm: Add folio_mapcount
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is the folio equivalent of page_mapcount().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/mm.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index a4f2818aeb1d..fc15a256e686 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -869,6 +869,22 @@ static inline int page_mapcount(struct page *page)
 	return atomic_read(&page->_mapcount) + 1;
 }
 
+/**
+ * folio_mapcount - The number of mappings of this folio.
+ * @folio: The folio.
+ *
+ * The result includes the number of times any of the pages in the
+ * folio are mapped to userspace.
+ *
+ * Return: The number of page table entries which refer to this folio.
+ */
+static inline int folio_mapcount(struct folio *folio)
+{
+	if (unlikely(FolioMulti(folio)))
+		return __page_mapcount(&folio->page);
+	return atomic_read(&folio->_mapcount) + 1;
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 int total_mapcount(struct page *page);
 int page_trans_huge_mapcount(struct page *page, int *total_mapcount);
-- 
2.30.2

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

