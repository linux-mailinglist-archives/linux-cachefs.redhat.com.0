Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CD823355752
	for <lists+linux-cachefs@lfdr.de>; Tue,  6 Apr 2021 17:08:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-553-hQCpjZSYNyCovM7XuYjrcw-1; Tue, 06 Apr 2021 11:08:25 -0400
X-MC-Unique: hQCpjZSYNyCovM7XuYjrcw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9413D107ACCA;
	Tue,  6 Apr 2021 15:08:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1EF385D9D0;
	Tue,  6 Apr 2021 15:08:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5D5E11809C83;
	Tue,  6 Apr 2021 15:08:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 136F8Ime020368 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 6 Apr 2021 11:08:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 20B9F2026D65; Tue,  6 Apr 2021 15:08:18 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ADDD2026D7F
	for <linux-cachefs@redhat.com>; Tue,  6 Apr 2021 15:08:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F605104D9A1
	for <linux-cachefs@redhat.com>; Tue,  6 Apr 2021 15:08:15 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-332-GOe57A4AN_q_OzlOSEHDzA-1; Tue, 06 Apr 2021 11:08:12 -0400
X-MC-Unique: GOe57A4AN_q_OzlOSEHDzA-1
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lTnH4-00Cz7X-Fq; Tue, 06 Apr 2021 15:06:09 +0000
Date: Tue, 6 Apr 2021 16:05:50 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20210406150550.GA3094215@infradead.org>
References: <20210331184728.1188084-1-willy@infradead.org>
	<20210331184728.1188084-2-willy@infradead.org>
	<20210406122918.h5dsnbjhmwpfasf4@box.shutemov.name>
	<20210406124807.GO2531743@casper.infradead.org>
	<20210406143150.GA3082513@infradead.org>
	<20210406144022.GR2531743@casper.infradead.org>
	<20210406144712.GA3087660@infradead.org>
	<20210406145511.GS2531743@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210406145511.GS2531743@casper.infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
	linux-mm@kvack.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, "Kirill A. Shutemov" <kirill@shutemov.name>,
	linux-afs@lists.infradead.org
Subject: Re: [Linux-cachefs] [PATCH v6 01/27] mm: Introduce struct folio
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
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 06, 2021 at 03:55:11PM +0100, Matthew Wilcox wrote:
> Assuming we're getting rid of them all though, we have to include:
> 
> $ git grep 'page->mapping' fs |wc -l
> 358
> $ git grep 'page->index' fs |wc -l
> 355

Are they all going to stay?  Or are we going to clean up some of that
mess.  A lot of ->index should be page_offet, and on the mapping side
the page_mapping and page_file_mapping mess is also waiting to be
sorted..

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

