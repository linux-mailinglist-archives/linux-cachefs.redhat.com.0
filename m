Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 91FA8356403
	for <lists+linux-cachefs@lfdr.de>; Wed,  7 Apr 2021 08:34:15 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-aZtdr0VxMkuKv7rJD2SVvg-1; Wed, 07 Apr 2021 02:34:13 -0400
X-MC-Unique: aZtdr0VxMkuKv7rJD2SVvg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E339081744F;
	Wed,  7 Apr 2021 06:34:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 85BA75D755;
	Wed,  7 Apr 2021 06:34:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2CBBD1809C83;
	Wed,  7 Apr 2021 06:34:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1376XxdJ008967 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 7 Apr 2021 02:34:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 776942026D65; Wed,  7 Apr 2021 06:33:59 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 723A92026D64
	for <linux-cachefs@redhat.com>; Wed,  7 Apr 2021 06:33:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17FBA185A7A7
	for <linux-cachefs@redhat.com>; Wed,  7 Apr 2021 06:33:57 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-589-7JFIQLmJOPqNjMT18aLuYw-1; Wed, 07 Apr 2021 02:33:54 -0400
X-MC-Unique: 7JFIQLmJOPqNjMT18aLuYw-1
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lU1N6-00DzNF-Be; Wed, 07 Apr 2021 06:09:08 +0000
Date: Wed, 7 Apr 2021 07:09:00 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20210407060900.GA3333828@infradead.org>
References: <20210331184728.1188084-1-willy@infradead.org>
	<20210331184728.1188084-2-willy@infradead.org>
	<20210406122918.h5dsnbjhmwpfasf4@box.shutemov.name>
	<20210406124807.GO2531743@casper.infradead.org>
	<20210406143150.GA3082513@infradead.org>
	<20210406144022.GR2531743@casper.infradead.org>
	<20210406144712.GA3087660@infradead.org>
	<20210406145511.GS2531743@casper.infradead.org>
	<20210406150550.GA3094215@infradead.org>
	<20210406162530.GT2531743@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210406162530.GT2531743@casper.infradead.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 06, 2021 at 05:25:30PM +0100, Matthew Wilcox wrote:
> About a third of ->index can be folio_offset(), based on a crude:
> 
> $ git grep 'page->index.*PAGE_' |wc -l
> 101
> 
> and I absolutely don't mind cleaning that up as part of the folio work,
> but that still leaves 200-250 instances that would need to be changed
> later.
> 
> I don't want to change the page->mapping to calls to folio_mapping().
> That's a lot of extra work for a page which the filesystem knows belongs
> to it.  folio_mapping() only needs to be used for pages which might not
> belong to a filesystem.
> 
> page_file_mapping() absolutely needs to go away.  The way to do that
> is to change swap-over-nfs to use direct IO, and then NFS can use
> folio->mapping like all other filesystems.  f2fs is just terminally
> confused and shouldn't be using page_file_mapping at all.  I'll fix
> that as part of the folio work.

Thanks.  So my opinion for now remains preferably just don't add
the union and derefence through the page.  But I'm not going to block
the series for it, as I think it is a huge and badly needed cleanup
required to make further use of larger pages / large chunks of memory
in the pagecache and the file systems.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

