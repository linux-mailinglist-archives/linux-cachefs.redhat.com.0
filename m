Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0E59E2CE97D
	for <lists+linux-cachefs@lfdr.de>; Fri,  4 Dec 2020 09:25:12 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-ZDTu14tKP-aXCEDk4Gv7Jw-1; Fri, 04 Dec 2020 03:25:10 -0500
X-MC-Unique: ZDTu14tKP-aXCEDk4Gv7Jw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAB1F80EDB1;
	Fri,  4 Dec 2020 08:25:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BF9AA2BCEC;
	Fri,  4 Dec 2020 08:25:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 253F24BB40;
	Fri,  4 Dec 2020 08:25:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B41p0an031905 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 20:51:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 37E222166B2F; Fri,  4 Dec 2020 01:51:00 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32E092166B2B
	for <linux-cachefs@redhat.com>; Fri,  4 Dec 2020 01:50:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5403185A7BC
	for <linux-cachefs@redhat.com>; Fri,  4 Dec 2020 01:50:56 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
	[209.85.166.169]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-98-u-yOgURQMWyEbkg0Nr8rPw-1; Thu, 03 Dec 2020 20:50:54 -0500
X-MC-Unique: u-yOgURQMWyEbkg0Nr8rPw-1
Received: by mail-il1-f169.google.com with SMTP id 2so705190ilg.9;
	Thu, 03 Dec 2020 17:50:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qCJ1it8zJOPA25xd7mTUoE9DDkyV+Z6lS0LOQKBluo0=;
	b=rgPOYcdzHbyilF0OLA2ZmxQarKJts2rQWeH3aQp3FYinVsKRGLD38Qf4uDA2gLFyey
	ND6+inIbYuUC5XFU9KKeJPHR8koWuB7jEFZOEvYwCylEQ9Putdwnqv4xXXWjx6wAKvfW
	hEaLLHaQPGIqv9cSzec/HwgQSpMQLO2Z42mACWcOcacDQ/yY0pF8gEOJ+vNPh7a1rIpx
	T200J6NOVqCfQWs8Qh0ETwC/y1QxU8+Uz4G6WJyGhOe/1ozfcmiXjMOzm5sCuLxlJpI7
	olPFWGsOZOruK5nDhhf8i6tpFNQ8i09mgb87vDM9eVob+eoLhq6bns025p77n6E2RA6x
	gtWg==
X-Gm-Message-State: AOAM531IrOCoW3iMWv31EZ0gqxOZCdLaqMhgS8mDy0XbzUFd4qYwbWRO
	+ZKEGbl7O1HMuy3OE8oofA6xT+fAAbUaj2DL3+Q=
X-Google-Smtp-Source: ABdhPJxNOVrY2lOh8aL9bBkX6+LKDEDdxJSpo+BUoWAH3laql3zLcmCNBdDRDFtgVk8HH39l+UrYqK7k8r6H/NkGXSA=
X-Received: by 2002:a92:a115:: with SMTP id v21mr2821782ili.203.1607046654009; 
	Thu, 03 Dec 2020 17:50:54 -0800 (PST)
MIME-Version: 1.0
References: <914680.1607004656@warthog.procyon.org.uk>
	<20201203221202.GA4170059@dread.disaster.area>
	<20201203230541.GL11935@casper.infradead.org>
In-Reply-To: <20201203230541.GL11935@casper.infradead.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 4 Dec 2020 09:50:18 +0800
Message-ID: <CALOAHbCW1i=P=NB6z9gb0=20GD_7ymbZ_HVyFj7_O-VxBRjw9A@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 04 Dec 2020 03:24:58 -0500
Cc: Christoph Hellwig <hch@infradead.org>, Dave Chinner <david@fromorbit.com>,
	linux-cachefs@redhat.com, Dave Chinner <dchinner@redhat.com>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [Linux-cachefs] Problems doing DIO to netfs cache on XFS from
	Ceph
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
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

On Fri, Dec 4, 2020 at 7:05 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> Might be a good idea to cc Yafang on this ...
>

Thanks

> On Fri, Dec 04, 2020 at 09:12:02AM +1100, Dave Chinner wrote:
> > On Thu, Dec 03, 2020 at 02:10:56PM +0000, David Howells wrote:
> > > Hi Christoph,
> > >
> > > We're having a problem making the fscache/cachefiles rewrite work with XFS, if
> > > you could have a look?  Jeff Layton just tripped the attached warning from
> > > this:
> > >
> > >     /*
> > >      * Given that we do not allow direct reclaim to call us, we should
> > >      * never be called in a recursive filesystem reclaim context.
> > >      */
> > >     if (WARN_ON_ONCE(current->flags & PF_MEMALLOC_NOFS))
> > >             goto redirty;
> >
> > I've pointed out in other threads where issues like this have been
> > raised that this check is not correct and was broken some time ago
> > by the PF_FSTRANS removal. The "NOFS" case here was originally using
> > PF_FSTRANS to protect against recursion from within transaction
> > contexts, not recursion through memory reclaim.  Doing writeback
> > from memory reclaim is caught by the preceeding PF_MEMALLOC check,
> > not this one.
> >
> > What it is supposed to be warning about is that writeback in XFS can
> > start new transactions and nesting transactions is a guaranteed way
> > to deadlock the journal. IOWs, doing writeback from an active
> > transaction context is a bug in XFS.
> >
> > IOWs, we are waiting on a new version of this patchset to be posted:
> >
> > https://lore.kernel.org/linux-xfs/20201103131754.94949-1-laoar.shao@gmail.com/
> >

I will post it soon.

> > so that we can get rid of this from iomap and check the transaction
> > recursion case directly in the XFS code. Then your problem goes away
> > completely....
> >
> > Cheers,
> >
> > Dave.
> > --
> > Dave Chinner
> > david@fromorbit.com



-- 
Thanks
Yafang

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

