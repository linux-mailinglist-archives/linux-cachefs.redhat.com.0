Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A6F47CDCF
	for <lists+linux-cachefs@lfdr.de>; Wed, 22 Dec 2021 09:02:57 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-hNGu4s0NOgKw9choteeY_Q-1; Wed, 22 Dec 2021 03:02:53 -0500
X-MC-Unique: hNGu4s0NOgKw9choteeY_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2D195233;
	Wed, 22 Dec 2021 08:02:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E17F4048;
	Wed, 22 Dec 2021 08:02:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5AE331809CB8;
	Wed, 22 Dec 2021 08:02:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BM82eNp022780 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 22 Dec 2021 03:02:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B24F040149AA; Wed, 22 Dec 2021 08:02:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE6864035788
	for <linux-cachefs@redhat.com>; Wed, 22 Dec 2021 08:02:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 95F5228EB6EA
	for <linux-cachefs@redhat.com>; Wed, 22 Dec 2021 08:02:40 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
	[209.85.160.179]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-594-5R4QEZ96NMO_MPvJjxcepg-1; Wed, 22 Dec 2021 03:02:39 -0500
X-MC-Unique: 5R4QEZ96NMO_MPvJjxcepg-1
Received: by mail-qt1-f179.google.com with SMTP id v22so1231968qtx.8;
	Wed, 22 Dec 2021 00:02:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eEHO9mF2ihCkk9k6a/idoNBNvOKWMCPKO1yXdk6ABVQ=;
	b=gswSJlyXzib5qBp4JXB/vDdp82j2jF8tHEuwe81GumtD0yPRptKyq//MsVq6Yu61qT
	W2NWVmBSY5qxfzVOXdNdfeQxs1JmZhqObcECcfX4xqMe/qnK/v0bAzDLBcIKap0eFj+G
	ifx/gICYzsGQbtcSUQQW+V+/amuwc3e1z1Y94YDSpNHaaJL/SmpABCDJp7SQE8Xqi40c
	C7KZActpO8txnrogdQc6sKg06bMTZZ1QITfuYn0W8aW5IwRC0l7G7ygXJPLt5WcIdwad
	zemZjq5WLwl3hjFVq51f3ud2TZWBwVfEfEgL7bzstu5keyTsXPUnyMyn41EuOEcxxpN7
	XEfw==
X-Gm-Message-State: AOAM530QMdbpvNfB9X7+TwahsqRig79j4n9JGfBAvQlbXXUGC8WHi4tU
	dkA0ujA2PA1xYp86kccJW7+qOGB6APOaDSb5Q4pUgoZ6wBiAcg==
X-Google-Smtp-Source: ABdhPJxE83WxXenOaQLGWEZKR8S/ngERCAo39PxXlPYIFzgmWE6XIX8ED0EEjeGPv4PBFRACkMEpCHVVp18YzJq+fQQ=
X-Received: by 2002:a05:622a:120b:: with SMTP id
	y11mr1275305qtx.544.1640160158101; 
	Wed, 22 Dec 2021 00:02:38 -0800 (PST)
MIME-Version: 1.0
References: <1638952658-20285-1-git-send-email-huangzhaoyang@gmail.com>
	<2868725.1638995206@warthog.procyon.org.uk>
	<CAGWkznHcuiwPPMZE95nYG=EFkM8NmLUQZooS5+a+GigP50qksg@mail.gmail.com>
	<73896.1640098820@warthog.procyon.org.uk>
In-Reply-To: <73896.1640098820@warthog.procyon.org.uk>
From: Zhaoyang Huang <huangzhaoyang@gmail.com>
Date: Wed, 22 Dec 2021 16:02:18 +0800
Message-ID: <CAGWkznGgyS5VrcuYkWR_7sbDOkr0k2mDNUwF6F6N-Y_3GGtoJA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 21, 2021 at 11:01 PM David Howells <dhowells@redhat.com> wrote:
>
> Zhaoyang Huang <huangzhaoyang@gmail.com> wrote:
>
> > > > -             if (!(gfp_flags & __GFP_DIRECT_RECLAIM) || !(gfp_flags & __GFP_FS))
> > > > +             if (current_is_kswapd() || !(gfp_flags & __GFP_FS))
> > > >                       return false;
> > > >               wait_on_page_fscache(page);
> > ...
> > If the gfp flag here is used for judging kswapd context, I think the
> > answer is yes as kswapd applied __GFP_DIRECT_RECLAIM.
>
> Now I come to look at applying it, I'm not sure whether this change is right.
>
> I don't know if kswapd has anything to do with it.  The check is to see if
> we're allowed to block at this point - and wait is just for the completion of
> a DIO write to disk.
>
> It would seem like gfpflags_allow_blocking() is the right thing to call - and
> that should use current_is_kswapd() if appropriate.
>
> David
According to my understanding, this check is redundant according to
current vmscan logic. For the allocation which deny
__GFP_DIRECT_RECLAIM could NOT have the context reach here as there is
no synchronous reclaiming. while kswapd also has __GFP_DIRECT_RECLAIM
set and would also block on the page's release.
>

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

