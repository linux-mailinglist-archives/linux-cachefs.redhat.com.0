Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F3D47C219
	for <lists+linux-cachefs@lfdr.de>; Tue, 21 Dec 2021 16:01:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640098910;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gQLLqt3wds9einSFkpABIffWnnM9MK7SVxp3BUZi5Xg=;
	b=cj6ZdsYJ8AWEZ0EqouT/hUEC89QK/6KLPAFLungfFI+gZ4+cwKvlKzmv1D6nDoaBwLeYWB
	DtRmp8waT5Qw5tUIyK04XSns8IMoy0CzjNswGp3wik5fPM6S3QHlIiHha8JFRxd8pGkGzu
	IzO8RqZ6P1VQ3Sg1IbD0hmPTYgw8QTo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-H88xn2HcMP2n4cmIGVMUaA-1; Tue, 21 Dec 2021 10:01:44 -0500
X-MC-Unique: H88xn2HcMP2n4cmIGVMUaA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1250B100D84F;
	Tue, 21 Dec 2021 15:00:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F040519C8;
	Tue, 21 Dec 2021 15:00:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 86B4C4BB7C;
	Tue, 21 Dec 2021 15:00:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BLF0mk5010193 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 21 Dec 2021 10:00:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F2B7A418E; Tue, 21 Dec 2021 15:00:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 14EBC5BD34;
	Tue, 21 Dec 2021 15:00:20 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CAGWkznHcuiwPPMZE95nYG=EFkM8NmLUQZooS5+a+GigP50qksg@mail.gmail.com>
References: <CAGWkznHcuiwPPMZE95nYG=EFkM8NmLUQZooS5+a+GigP50qksg@mail.gmail.com>
	<1638952658-20285-1-git-send-email-huangzhaoyang@gmail.com>
	<2868725.1638995206@warthog.procyon.org.uk>
To: Zhaoyang Huang <huangzhaoyang@gmail.com>
MIME-Version: 1.0
Date: Tue, 21 Dec 2021 15:00:20 +0000
Message-ID: <73896.1640098820@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1BLF0mk5010193
X-loop: linux-cachefs@redhat.com
Cc: Marc Dionne <marc.dionne@auristor.com>, linux-cachefs@redhat.com,
	LKML <linux-kernel@vger.kernel.org>,
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>
Subject: Re: [Linux-cachefs] [PATCH] fs: judging context via
	current_is_kswapd instead of gfp_flag
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
Content-ID: <73895.1640098820.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Zhaoyang Huang <huangzhaoyang@gmail.com> wrote:

> > > -             if (!(gfp_flags & __GFP_DIRECT_RECLAIM) || !(gfp_flags & __GFP_FS))
> > > +             if (current_is_kswapd() || !(gfp_flags & __GFP_FS))
> > >                       return false;
> > >               wait_on_page_fscache(page);
> ...
> If the gfp flag here is used for judging kswapd context, I think the
> answer is yes as kswapd applied __GFP_DIRECT_RECLAIM.

Now I come to look at applying it, I'm not sure whether this change is right.

I don't know if kswapd has anything to do with it.  The check is to see if
we're allowed to block at this point - and wait is just for the completion of
a DIO write to disk.

It would seem like gfpflags_allow_blocking() is the right thing to call - and
that should use current_is_kswapd() if appropriate.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

