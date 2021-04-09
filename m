Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E6DAB359EDB
	for <lists+linux-cachefs@lfdr.de>; Fri,  9 Apr 2021 14:35:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1617971749;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WepaJJYKbxM3aFGtFprRtbbIiANSSp/0l2EkNp0yafU=;
	b=X4LEtqqFLl5U0MVuR3y3qf5pkcsTvk7bstd3Sgqpd/hlMNDXUq8ZsjMc789aipJNEZF0uH
	K7qbsEhEhNO2qofytuvEiWd0x2GKmtNZlDkzrVzAOztFDjCgQ7xYay6PsICjU6lYzYCGSH
	xE5WbVlgkt/WEeRGIguTosQpAe/zC54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-RkmEGQ-IPkicXL-pbn8lRw-1; Fri, 09 Apr 2021 08:35:48 -0400
X-MC-Unique: RkmEGQ-IPkicXL-pbn8lRw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DECFD6D4EE;
	Fri,  9 Apr 2021 12:35:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DFC860C05;
	Fri,  9 Apr 2021 12:35:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 31B501806D0E;
	Fri,  9 Apr 2021 12:35:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 139CZeof007000 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 9 Apr 2021 08:35:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E96CE5D9C0; Fri,  9 Apr 2021 12:35:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-119-35.rdu2.redhat.com
	[10.10.119.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E65E55DAA5;
	Fri,  9 Apr 2021 12:35:34 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20210409111636.GR2531743@casper.infradead.org>
References: <20210409111636.GR2531743@casper.infradead.org>
	<CAHk-=wi_XrtTanTwoKs0jwnjhSvwpMYVDJ477VtjvvTXRjm5wQ@mail.gmail.com>
	<161796595714.350846.1547688999823745763.stgit@warthog.procyon.org.uk>
To: Matthew Wilcox <willy@infradead.org>
MIME-Version: 1.0
Date: Fri, 09 Apr 2021 13:35:34 +0100
Message-ID: <625171.1617971734@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, jlayton@kernel.org,
	linux-kernel@vger.kernel.org, linux-afs@lists.infradead.org,
	linux-mm@kvack.org, ceph-devel@vger.kernel.org,
	linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org,
	v9fs-developer@lists.sourceforge.net,
	Andrew Morton <akpm@linux-foundation.org>,
	torvalds@linux-foundation.org, hch@lst.de
Subject: Re: [Linux-cachefs] [RFC PATCH 2/3] mm: Return bool from pagebit
	test functions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <625170.1617971734.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Matthew Wilcox <willy@infradead.org> wrote:

> iirc i looked at doing this as part of the folio work, and it ended up
> increasing the size of the kernel.  Did you run bloat-o-meter on the
> result of doing this?

add/remove: 2/2 grow/shrink: 15/16 up/down: 408/-599 (-191)
Function                                     old     new   delta
iomap_write_end_inline                         -     128    +128
try_to_free_swap                              59     179    +120
page_to_index.part                             -      36     +36
page_size                                    432     456     +24
PageTransCompound                            154     175     +21
truncate_inode_pages_range                   791     807     +16
invalidate_inode_pages2_range                504     518     +14
ceph_uninline_data                           969     982     +13
iomap_read_inline_data.isra                  129     139     +10
page_cache_pipe_buf_confirm                   85      93      +8
ceph_writepages_start                       3237    3243      +6
hpage_pincount_available                      94      97      +3
__collapse_huge_page_isolate                 768     771      +3
page_vma_mapped_walk                        1070    1072      +2
PageHuge                                      39      41      +2
collapse_file                               2046    2047      +1
__free_pages_ok                              449     450      +1
wait_on_page_bit_common                      598     597      -1
iomap_page_release                           104     103      -1
change_pte_range                             818     817      -1
pageblock_skip_persistent                     45      42      -3
is_transparent_hugepage                       63      60      -3
nfs_readpage                                 486     482      -4
ext4_readpage_inline                         155     151      -4
release_pages                                640     635      -5
ext4_write_inline_data_end                   286     281      -5
ext4_mb_load_buddy_gfp                       690     684      -6
afs_dir_check                                536     529      -7
page_trans_huge_map_swapcount                374     363     -11
io_uring_mmap                                199     184     -15
io_buffer_account_pin                        276     259     -17
page_to_index                                 50       -     -50
iomap_write_end                              375     306     -69
try_to_free_swap.part                        137       -    -137
PageUptodate                                 716     456    -260
Total: Before=17207139, After=17206948, chg -0.00%

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

