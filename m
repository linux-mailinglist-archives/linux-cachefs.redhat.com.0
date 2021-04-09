Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 663CB35A63F
	for <lists+linux-cachefs@lfdr.de>; Fri,  9 Apr 2021 20:52:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-JKTpJ-k9MayXXRhYzylQtA-1; Fri, 09 Apr 2021 14:52:55 -0400
X-MC-Unique: JKTpJ-k9MayXXRhYzylQtA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4677C192203B;
	Fri,  9 Apr 2021 18:52:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 364EB5C1D5;
	Fri,  9 Apr 2021 18:52:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DEFC31806D0E;
	Fri,  9 Apr 2021 18:52:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139IqoC1018230 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 14:52:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C463219B8B4; Fri,  9 Apr 2021 18:52:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7768D219B8B3
	for <linux-cachefs@redhat.com>; Fri,  9 Apr 2021 18:52:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8047D805F44
	for <linux-cachefs@redhat.com>; Fri,  9 Apr 2021 18:52:46 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-288-oRos5jQIPXy7uvV4EtwyNA-1; Fri, 09 Apr 2021 14:52:44 -0400
X-MC-Unique: oRos5jQIPXy7uvV4EtwyNA-1
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lUwEA-000n0R-Q0; Fri, 09 Apr 2021 18:51:40 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-mm@kvack.org
Date: Fri,  9 Apr 2021 19:50:38 +0100
Message-Id: <20210409185105.188284-2-willy@infradead.org>
In-Reply-To: <20210409185105.188284-1-willy@infradead.org>
References: <20210409185105.188284-1-willy@infradead.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org,
	"Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
	linux-afs@lists.infradead.org
Subject: [Linux-cachefs] [PATCH v7 01/28] mm: Optimise nth_page for
	contiguous memmap
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

If the memmap is virtually contiguous (either because we're using
a virtually mapped memmap or because we don't support a discontig
memmap at all), then we can implement nth_page() by simple addition.
Contrary to popular belief, the compiler is not able to optimise this
itself for a vmemmap configuration.  This reduces one example user (sg.c)
by four instructions:

        struct page *page = nth_page(rsv_schp->pages[k], offset >> PAGE_SHIFT);

before:
   49 8b 45 70             mov    0x70(%r13),%rax
   48 63 c9                movslq %ecx,%rcx
   48 c1 eb 0c             shr    $0xc,%rbx
   48 8b 04 c8             mov    (%rax,%rcx,8),%rax
   48 2b 05 00 00 00 00    sub    0x0(%rip),%rax
           R_X86_64_PC32      vmemmap_base-0x4
   48 c1 f8 06             sar    $0x6,%rax
   48 01 d8                add    %rbx,%rax
   48 c1 e0 06             shl    $0x6,%rax
   48 03 05 00 00 00 00    add    0x0(%rip),%rax
           R_X86_64_PC32      vmemmap_base-0x4

after:
   49 8b 45 70             mov    0x70(%r13),%rax
   48 63 c9                movslq %ecx,%rcx
   48 c1 eb 0c             shr    $0xc,%rbx
   48 c1 e3 06             shl    $0x6,%rbx
   48 03 1c c8             add    (%rax,%rcx,8),%rbx

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/mm.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index b58c73e50da0..036f63a44a5c 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -234,7 +234,11 @@ int overcommit_policy_handler(struct ctl_table *, int, void *, size_t *,
 int __add_to_page_cache_locked(struct page *page, struct address_space *mapping,
 		pgoff_t index, gfp_t gfp, void **shadowp);
 
+#if defined(CONFIG_SPARSEMEM) && !defined(CONFIG_SPARSEMEM_VMEMMAP)
 #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
+#else
+#define nth_page(page,n) ((page) + (n))
+#endif
 
 /* to align the pointer to the (next) page boundary */
 #define PAGE_ALIGN(addr) ALIGN(addr, PAGE_SIZE)
-- 
2.30.2

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

