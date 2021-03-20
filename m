Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 67851342AE6
	for <lists+linux-cachefs@lfdr.de>; Sat, 20 Mar 2021 06:42:23 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-ZWNzX_eHMiioQQ2tfpzjzQ-1; Sat, 20 Mar 2021 01:42:20 -0400
X-MC-Unique: ZWNzX_eHMiioQQ2tfpzjzQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89DA9180FCA6;
	Sat, 20 Mar 2021 05:42:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 715321F40A;
	Sat, 20 Mar 2021 05:42:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B0944BB7C;
	Sat, 20 Mar 2021 05:42:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12K5gHmk004048 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 20 Mar 2021 01:42:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7B790117C2F6; Sat, 20 Mar 2021 05:42:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76848117C2F0
	for <linux-cachefs@redhat.com>; Sat, 20 Mar 2021 05:42:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED475185A7BA
	for <linux-cachefs@redhat.com>; Sat, 20 Mar 2021 05:42:12 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-370-mEyqewe1PvWEzRC5VtsRfg-1; Sat, 20 Mar 2021 01:42:09 -0400
X-MC-Unique: mEyqewe1PvWEzRC5VtsRfg-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lNUMx-005SU4-EH; Sat, 20 Mar 2021 05:41:52 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org
Date: Sat, 20 Mar 2021 05:40:43 +0000
Message-Id: <20210320054104.1300774-7-willy@infradead.org>
In-Reply-To: <20210320054104.1300774-1-willy@infradead.org>
References: <20210320054104.1300774-1-willy@infradead.org>
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
Subject: [Linux-cachefs] [PATCH v5 06/27] mm/vmstat: Add functions to
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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

