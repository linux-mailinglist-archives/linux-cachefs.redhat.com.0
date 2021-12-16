Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F06B5477D5A
	for <lists+linux-cachefs@lfdr.de>; Thu, 16 Dec 2021 21:21:17 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-454-EvXDO8XLNVG8ioHayRhXLw-1; Thu, 16 Dec 2021 15:21:12 -0500
X-MC-Unique: EvXDO8XLNVG8ioHayRhXLw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A91ED92525;
	Thu, 16 Dec 2021 20:20:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 426A06D03D;
	Thu, 16 Dec 2021 20:20:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 114851809CB8;
	Thu, 16 Dec 2021 20:20:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BGKKhwb002188 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 16 Dec 2021 15:20:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 09AD746CFC5; Thu, 16 Dec 2021 20:20:43 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05BC046CFC4
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 20:20:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E00BB80A0AF
	for <linux-cachefs@redhat.com>; Thu, 16 Dec 2021 20:20:42 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-580-M5Q47K8gOuOm75fNtavnYg-1; Thu, 16 Dec 2021 15:20:41 -0500
X-MC-Unique: M5Q47K8gOuOm75fNtavnYg-1
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
	Hat Linux)) id 1mxxEx-00FvEE-Bh; Thu, 16 Dec 2021 20:20:35 +0000
Date: Thu, 16 Dec 2021 20:20:35 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <YbufkzMCoxssd6Vi@casper.infradead.org>
References: <163967073889.1823006.12237147297060239168.stgit@warthog.procyon.org.uk>
	<163967169723.1823006.2868573008412053995.stgit@warthog.procyon.org.uk>
	<CAHk-=wi0H5vmka1_iWe0+Yc6bwtgWn_bEEHCMYsPHYtNJKZHCQ@mail.gmail.com>
	<YbuTaRbNUAJx5xOA@casper.infradead.org>
	<CAHk-=wh2dr=NgVSVj0sw-gSuzhxhLRV5FymfPS146zGgF4kBjA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wh2dr=NgVSVj0sw-gSuzhxhLRV5FymfPS146zGgF4kBjA@mail.gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, "open list:NFS, SUNRPC,
	AND..." <linux-nfs@vger.kernel.org>, CIFS <linux-cifs@vger.kernel.org>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Anna Schumaker <anna.schumaker@netapp.com>, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	ceph-devel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
	linux-afs@lists.infradead.org, v9fs-developer@lists.sourceforge.net
Subject: Re: [Linux-cachefs] [PATCH v3 56/68] afs: Handle len being
 extending over page end in write_begin/write_end
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

On Thu, Dec 16, 2021 at 11:46:18AM -0800, Linus Torvalds wrote:
> On Thu, Dec 16, 2021 at 11:28 AM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > Since ->write_begin is the place where we actually create folios, it
> > needs to know what size folio to create.  Unless you'd rather we do
> > something to actually create the folio before calling ->write_begin?
> 
> I don't think we can create a folio before that, because the
> filesystem may not even want a folio (think persistent memory or
> whatever).
> 
> Honestly, I think you need to describe more what you actually want to
> happen. Because generic_perform_write() has already decided to use a
> PAGE_SIZE by the time write_begin() is called,
> 
> Right now the world order is "we chunk things by PAGE_SIZE", and
> that's just how it is.

Right.  And we could leave it like that.  There's a huge amount of win
that comes from just creating large folios as part of readahead, and
anything we do for writes is going to be a smaller win.

That said, I would like it if a program which does:

fd = creat("foo", 0644);
write(fd, buf, 64 * 1024);
close(fd);

uses a single 64k page.

> I can see other options - like the filesystem passing in the chunk
> size when it calls generic_perform_write().

I'm hoping to avoid that.  Ideally filesystems don't know what the
"chunk size" is that's being used; they'll see a mixture of sizes
being used for any given file (potentially).  Depends on access
patterns, availability of higher-order memory, etc.

> Or we make the rule be that ->write_begin() simply always is given the
> whole area, and the filesystem can decide how it wants to chunk things
> up, and return the size of the write chunk in the status (rather than
> the current "success or error").

We do need to be slightly more limiting than "always gets the whole
area", because we do that fault_in_iov_iter_readable() call first,
and if the user has been mean and asked to write() 2GB of memory on
a (virtual) machine with 256MB, I'd prefer it if we didn't swap our way
through 2GB of address space before calling into ->write_begin.

> But at no point will this *EVER* be a "afs will limit the size to the
> folio size" issue. Nothing like that will ever make sense. Allowing
> bigger chunks will not be about any fscache issues, it will be about
> every single filesystem that uses generic_perform_write().

I agree that there should be nothing here that is specific to fscache.
David has in the past tried to convince me that he should always get
256kB folios, and I've done my best to explain that the MM just isn't
going to make that guarantee.

That said, this patch seems to be doing the right thing; it passes
the entire length into netfs_write_begin(), and is then truncating
the length to stop at the end of the folio that it got back.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

