Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB8F3556B4
	for <lists+linux-cachefs@lfdr.de>; Tue,  6 Apr 2021 16:33:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-g2LN5EQOM4mgNf2c3jsg0g-1; Tue, 06 Apr 2021 10:33:08 -0400
X-MC-Unique: g2LN5EQOM4mgNf2c3jsg0g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC70F107B287;
	Tue,  6 Apr 2021 14:33:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3F4419C45;
	Tue,  6 Apr 2021 14:33:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A4684BB7C;
	Tue,  6 Apr 2021 14:33:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 136EX2d0017274 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 6 Apr 2021 10:33:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1E757112D439; Tue,  6 Apr 2021 14:33:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AE3910060E0
	for <linux-cachefs@redhat.com>; Tue,  6 Apr 2021 14:32:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD06E104D9A5
	for <linux-cachefs@redhat.com>; Tue,  6 Apr 2021 14:32:59 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-472-DTQThDbWPVW5XKMxw7iTdg-1; Tue, 06 Apr 2021 10:32:56 -0400
X-MC-Unique: DTQThDbWPVW5XKMxw7iTdg-1
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
	Linux)) id 1lTmkA-00CwNG-RE; Tue, 06 Apr 2021 14:32:10 +0000
Date: Tue, 6 Apr 2021 15:31:50 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <20210406143150.GA3082513@infradead.org>
References: <20210331184728.1188084-1-willy@infradead.org>
	<20210331184728.1188084-2-willy@infradead.org>
	<20210406122918.h5dsnbjhmwpfasf4@box.shutemov.name>
	<20210406124807.GO2531743@casper.infradead.org>
MIME-Version: 1.0
In-Reply-To: <20210406124807.GO2531743@casper.infradead.org>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-cachefs@redhat.com,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 06, 2021 at 01:48:07PM +0100, Matthew Wilcox wrote:
> Now, maybe we should put this optimisation into the definition of nth_page?

That would be nice.

> > As Christoph, I'm not a fan of this :/
> 
> What would you prefer?

Looking at your full folio series on git.infradead.org, there are a
total of 12 references to non-page members of struct folio, assuming
my crude grep that expects a folio to be named folio did not miss any.

Except for one that prints folio->flags in cachefiles code, and which
should go away they are all in core MM code in mm/ or include/.  With
enough file system conversions I do see potential uses for ->mapping
and ->index outside of core code, but IMHO we can ignore those for now
and just switch them over if/when we actually change the struct folio
internals to split them from tail pages.

So my opinion is:  leave these fields out for now, and when the problem
that we'd have a lot of reference out of core code arises deal with it
once we know about the scope.  Maybe we add wrappers for the few
members that are reasonable "public", maybe we then do the union
trick you have here because it is the least evil, or maybe we just do
not do anything at all until these fields move over to the folio
entirely.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

