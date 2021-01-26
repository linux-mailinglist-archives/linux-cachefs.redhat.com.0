Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D76EA304276
	for <lists+linux-cachefs@lfdr.de>; Tue, 26 Jan 2021 16:26:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611674795;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TkCUz8G9UR/VTDkFecsp5c7G8xZAqs0Itc19BEvTjVc=;
	b=IA0zNBAC8ZzjskIV8nf7ui7un+nPTReLR4+25Pu2I3JKIy7gsXwnJIwwyIYTL6wnHn+8X8
	58UEqneojd+/u6Y7S/GZIOOTLLRXP+8Bd2L9ZuAA2WEXXggyjb1KGmTEQrsOorjEZdHr9p
	p4Zt5b55QE9/viWCXN6zkNGAsOGWxAo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-3bhvPAInPbyqv9RILLpJag-1; Tue, 26 Jan 2021 10:26:33 -0500
X-MC-Unique: 3bhvPAInPbyqv9RILLpJag-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2EEC58018A7;
	Tue, 26 Jan 2021 15:26:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74CD35C1A3;
	Tue, 26 Jan 2021 15:26:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0282B4A7C6;
	Tue, 26 Jan 2021 15:26:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QFPbxU015638 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 10:25:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 223F22166B29; Tue, 26 Jan 2021 15:25:37 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CF062166B28
	for <linux-cachefs@redhat.com>; Tue, 26 Jan 2021 15:25:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C8CD08008A5
	for <linux-cachefs@redhat.com>; Tue, 26 Jan 2021 15:25:34 +0000 (UTC)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
	[209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-558-Ybf_sItbMYGQsku0JZEGpQ-1; Tue, 26 Jan 2021 10:25:33 -0500
X-MC-Unique: Ybf_sItbMYGQsku0JZEGpQ-1
Received: by mail-ed1-f71.google.com with SMTP id y6so9557620edc.17
	for <linux-cachefs@redhat.com>; Tue, 26 Jan 2021 07:25:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VJe0QMue+MrGLDqG9YMY3B8wc1OhQAcndv4QLZtzS5Q=;
	b=NgIGppNVZ/piO7zVAZdXJTxSTT5PZ2AJnA9C32TpQKch8xqyb406zqNhIxoVE2dP19
	bVijCXCHZUG74iZ/G1nQW6Y1vu4VW+8yAYbiPwZaZGTIbUaWyqKCxzm59g8LX3kpU9BR
	hV+xfFzQdjQWEEB9S2k/7D3xv/UcRCt/FP5cW3J6AZVmWeH1Vu9S+DOLeNURddGLpLmn
	5O/wpxsoOvlVrktx5keAxnbsCBzpJ2jWEa1Bx2nsjDUjq8/+XQj54S7UYsDWnTlJeIBh
	zIh7g9YCKSd6PJdlAxvqHnBmwil/PGqaGsH62lsMu3Pz00TjgpBuEwvoVJvEg9jYa0nm
	Sqcg==
X-Gm-Message-State: AOAM533DFoCD2Oo/MC6G/idoC0gJsyKgX171ry6nbY5bLvAFlWDto9K1
	q4UXn4CIM652eDnmmNCzEQqhjeB3k/vOVSCw2/0Y/xrXwcaVtm7S/Xx7SdBDLzbE8cX+L5ZkBY7
	y4kqxDiEYHYrqVC/EDhxMvn1RTeF1gD681nxsUA==
X-Received: by 2002:a05:6402:3589:: with SMTP id
	y9mr5114905edc.344.1611674731921; 
	Tue, 26 Jan 2021 07:25:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzlAcqaq8CqekYAOTl5XTKJw4byUxjRunvP1wQKBAqraCVAKiDEx3Vt3nz1iiXtLgQBV8BZqw1Aaq6eAK2Q72M=
X-Received: by 2002:a05:6402:3589:: with SMTP id
	y9mr5114888edc.344.1611674731765; 
	Tue, 26 Jan 2021 07:25:31 -0800 (PST)
MIME-Version: 1.0
References: <161161025063.2537118.2009249444682241405.stgit@warthog.procyon.org.uk>
	<161161057357.2537118.6542184374596533032.stgit@warthog.procyon.org.uk>
	<20210126040540.GK308988@casper.infradead.org>
In-Reply-To: <20210126040540.GK308988@casper.infradead.org>
From: David Wysochanski <dwysocha@redhat.com>
Date: Tue, 26 Jan 2021 10:24:55 -0500
Message-ID: <CALF+zOn80NoeaBW8i9djC8qBCEng7riaHgz77uhxipaZ+RJ5ew@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: Steve French <sfrench@samba.org>, linux-nfs <linux-nfs@vger.kernel.org>,
	linux-cifs <linux-cifs@vger.kernel.org>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-afs@lists.infradead.org, linux-cachefs@redhat.com,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Trond Myklebust <trondmy@hammerspace.com>,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	v9fs-developer@lists.sourceforge.net, ceph-devel@vger.kernel.org,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 27/32] NFS: Refactor nfs_readpage() and
 nfs_readpage_async() to use nfs_readdesc
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 25, 2021 at 11:06 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Jan 25, 2021 at 09:36:13PM +0000, David Howells wrote:
> > +int nfs_readpage_async(void *data, struct inode *inode,
> >                      struct page *page)
> >  {
> > +     struct nfs_readdesc *desc = (struct nfs_readdesc *)data;
>
> You don't need a cast to cast from void.
>
Right, fixing.

> > @@ -440,17 +439,16 @@ int nfs_readpages(struct file *filp, struct address_space *mapping,
> >       if (ret == 0)
> >               goto read_complete; /* all pages were read */
> >
> > -     desc.pgio = &pgio;
> > -     nfs_pageio_init_read(&pgio, inode, false,
> > +     nfs_pageio_init_read(&desc.pgio, inode, false,
>
> I like what you've done here, embedding the pgio in the desc.
>
Thanks for the review!

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

