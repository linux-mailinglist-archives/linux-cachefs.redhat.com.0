Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 635AA3506AF
	for <lists+linux-cachefs@lfdr.de>; Wed, 31 Mar 2021 20:48:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-341-gYBepUcrM2i1jG9MfG2mmw-1; Wed, 31 Mar 2021 14:48:51 -0400
X-MC-Unique: gYBepUcrM2i1jG9MfG2mmw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F14B107ACCD;
	Wed, 31 Mar 2021 18:48:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 29D7310023AC;
	Wed, 31 Mar 2021 18:48:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C7BA1809C83;
	Wed, 31 Mar 2021 18:48:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12VImkVb003856 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 31 Mar 2021 14:48:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5A7491018E4B; Wed, 31 Mar 2021 18:48:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5577A114B9C0
	for <linux-cachefs@redhat.com>; Wed, 31 Mar 2021 18:48:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D96F101A531
	for <linux-cachefs@redhat.com>; Wed, 31 Mar 2021 18:48:42 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-426-XqVh-uwoMvStvTHGDtWTSQ-1; Wed, 31 Mar 2021 14:48:40 -0400
X-MC-Unique: XqVh-uwoMvStvTHGDtWTSQ-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lRfsf-004z7a-UL; Wed, 31 Mar 2021 18:48:02 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org
Date: Wed, 31 Mar 2021 19:47:04 +0100
Message-Id: <20210331184728.1188084-4-willy@infradead.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH v6 03/27] mm/vmstat: Add functions to
	account folio statistics
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Allow page counters to be more readily modified by callers which have
a folio.  Name these wrappers with 'stat' instead of 'state' as requested
by Linus here:
https://lore.kernel.org/linux-mm/CAHk-=wj847SudR-kt+46fT3+xFFgiwpgThvm7DJWGdi4cVrbnQ@mail.gmail.com/

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/vmstat.h | 107 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/include/linux/vmstat.h b/include/linux/vmstat.h
index 3299cd69e4ca..d287d7c31b8f 100644
--- a/include/linux/vmstat.h
+++ b/include/linux/vmstat.h
@@ -402,6 +402,78 @@ static inline void drain_zonestat(struct zone *zone,
 			struct per_cpu_pageset *pset) { }
 #endif		/* CONFIG_SMP */
 
+static inline void __zone_stat_mod_folio(struct folio *folio,
+		enum zone_stat_item item, long nr)
+{
+	__mod_zone_page_state(folio_zone(folio), item, nr);
+}
+
+static inline void __zone_stat_add_folio(struct folio *folio,
+		enum zone_stat_item item)
+{
+	__mod_zone_page_state(folio_zone(folio), item, folio_nr_pages(folio));
+}
+
+static inline void __zone_stat_sub_folio(struct folio *folio,
+		enum zone_stat_item item)
+{
+	__mod_zone_page_state(folio_zone(folio), item, -folio_nr_pages(folio));
+}
+
+static inline void zone_stat_mod_folio(struct folio *folio,
+		enum zone_stat_item item, long nr)
+{
+	mod_zone_page_state(folio_zone(folio), item, nr);
+}
+
+static inline void zone_stat_add_folio(struct folio *folio,
+		enum zone_stat_item item)
+{
+	mod_zone_page_state(folio_zone(folio), item, folio_nr_pages(folio));
+}
+
+static inline void zone_stat_sub_folio(struct folio *folio,
+		enum zone_stat_item item)
+{
+	mod_zone_page_state(folio_zone(folio), item, -folio_nr_pages(folio));
+}
+
+static inline void __node_stat_mod_folio(struct folio *folio,
+		enum node_stat_item item, long nr)
+{
+	__mod_node_page_state(folio_pgdat(folio), item, nr);
+}
+
+static inline void __node_stat_add_folio(struct folio *folio,
+		enum node_stat_item item)
+{
+	__mod_node_page_state(folio_pgdat(folio), item, folio_nr_pages(folio));
+}
+
+static inline void __node_stat_sub_folio(struct folio *folio,
+		enum node_stat_item item)
+{
+	__mod_node_page_state(folio_pgdat(folio), item, -folio_nr_pages(folio));
+}
+
+static inline void node_stat_mod_folio(struct folio *folio,
+		enum node_stat_item item, long nr)
+{
+	mod_node_page_state(folio_pgdat(folio), item, nr);
+}
+
+static inline void node_stat_add_folio(struct folio *folio,
+		enum node_stat_item item)
+{
+	mod_node_page_state(folio_pgdat(folio), item, folio_nr_pages(folio));
+}
+
+static inline void node_stat_sub_folio(struct folio *folio,
+		enum node_stat_item item)
+{
+	mod_node_page_state(folio_pgdat(folio), item, -folio_nr_pages(folio));
+}
+
 static inline void __mod_zone_freepage_state(struct zone *zone, int nr_pages,
 					     int migratetype)
 {
@@ -530,6 +602,24 @@ static inline void __dec_lruvec_page_state(struct page *page,
 	__mod_lruvec_page_state(page, idx, -1);
 }
 
+static inline void __lruvec_stat_mod_folio(struct folio *folio,
+					   enum node_stat_item idx, int val)
+{
+	__mod_lruvec_page_state(&folio->page, idx, val);
+}
+
+static inline void __lruvec_stat_add_folio(struct folio *folio,
+					   enum node_stat_item idx)
+{
+	__lruvec_stat_mod_folio(folio, idx, folio_nr_pages(folio));
+}
+
+static inline void __lruvec_stat_sub_folio(struct folio *folio,
+					   enum node_stat_item idx)
+{
+	__lruvec_stat_mod_folio(folio, idx, -folio_nr_pages(folio));
+}
+
 static inline void inc_lruvec_page_state(struct page *page,
 					 enum node_stat_item idx)
 {
@@ -542,4 +632,21 @@ static inline void dec_lruvec_page_state(struct page *page,
 	mod_lruvec_page_state(page, idx, -1);
 }
 
+static inline void lruvec_stat_mod_folio(struct folio *folio,
+					 enum node_stat_item idx, int val)
+{
+	mod_lruvec_page_state(&folio->page, idx, val);
+}
+
+static inline void lruvec_stat_add_folio(struct folio *folio,
+					 enum node_stat_item idx)
+{
+	lruvec_stat_mod_folio(folio, idx, folio_nr_pages(folio));
+}
+
+static inline void lruvec_stat_sub_folio(struct folio *folio,
+					 enum node_stat_item idx)
+{
+	lruvec_stat_mod_folio(folio, idx, -folio_nr_pages(folio));
+}
 #endif /* _LINUX_VMSTAT_H */
-- 
2.30.2

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

