Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C08948AF3B
	for <lists+linux-cachefs@lfdr.de>; Tue, 11 Jan 2022 15:13:29 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-Fge6xcjZPV-fgvz3Qvw5Og-1; Tue, 11 Jan 2022 09:13:25 -0500
X-MC-Unique: Fge6xcjZPV-fgvz3Qvw5Og-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0240B84BA40;
	Tue, 11 Jan 2022 14:13:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA38C84D03;
	Tue, 11 Jan 2022 14:13:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 368891809CB8;
	Tue, 11 Jan 2022 14:13:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20BEDFHJ022797 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 11 Jan 2022 09:13:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 696B940218D5; Tue, 11 Jan 2022 14:13:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6534F401A992
	for <linux-cachefs@redhat.com>; Tue, 11 Jan 2022 14:13:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4C61A181E08C
	for <linux-cachefs@redhat.com>; Tue, 11 Jan 2022 14:13:15 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-436-MCwCAc2tNUCcEzfGeVnGmw-1; Tue, 11 Jan 2022 09:13:11 -0500
X-MC-Unique: MCwCAc2tNUCcEzfGeVnGmw-1
Received: by mail-pl1-f170.google.com with SMTP id x15so17359649plg.1;
	Tue, 11 Jan 2022 06:13:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=NTEyMLGbGhmFCbnpydRvg59PAfauM07s+DZGEXNSmNY=;
	b=XJ7rxPRtElmWv3BGrbV+8OYU7xswxsMyXxc07YcK860DkUt6mp74cC8uQ+xiaF2QJj
	q+1fFi/9Nrki1PFrCapme7cLRAOttINZuJSDbGRNTNRBSyTAwRhfUtbjTRltL2DXTMZj
	IXXeRGK9VDi26SbOkECKi8WN4C6PeYEMWaSCi9MlvkgLZ7o7MtnAp+t5GwGny28wDs5G
	LvrZm1qk+cztSbHlf6OjPqvRFzXY14TXkz1Cg8+yhqgjXoSc/XbYdguv/3bBZP/dMdDt
	un5+NMSq6LC0FhNt5i5qztKRELa5mLrVsS1W6uK7dYKbAW0q7uzPKJ+gVb2KZO7GJimT
	3awQ==
X-Gm-Message-State: AOAM530TXO2H6akyu0anbVxS/hPN+x40XgqTVriHN6EkizFKnrgMQxOA
	l3rtsIDAf7h80nB/1E1hEn4ba0kdzWs=
X-Google-Smtp-Source: ABdhPJzKN0mMu7RJynYNSluusDlBv+DG+sRewY0bcr48/Nd3FYqBodeX0VamiIBDub8wInoCVpqvNw==
X-Received: by 2002:a17:90b:194c:: with SMTP id
	nk12mr3323297pjb.5.1641910390351; 
	Tue, 11 Jan 2022 06:13:10 -0800 (PST)
Received: from xzhoux.usersys.redhat.com ([209.132.188.80])
	by smtp.gmail.com with ESMTPSA id
	h11sm2514807pjs.10.2022.01.11.06.13.07
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 11 Jan 2022 06:13:09 -0800 (PST)
Date: Tue, 11 Jan 2022 22:13:05 +0800
From: Murphy Zhou <jencce.kernel@gmail.com>
To: David Howells <dhowells@redhat.com>
Message-ID: <20220111141305.56z36gaogt72kwja@xzhoux.usersys.redhat.com>
References: <CADJHv_u3bqj82sFUWT=JJBWd1kjc14FUbVBd_9r18cMQOeudJw@mail.gmail.com>
	<CANT5p=rjTGNu2WooxRcu4JMM9wSyYY6S3kXtdfQ5caj1WnAEOA@mail.gmail.com>
	<CANT5p=pW1t5ggVsrMgNWi+CBpym5XXQ1dSwm-eH=vpczmL_nTg@mail.gmail.com>
	<CANT5p=oQeR90LPJKRUJ6eF+ti3Mefs48FfasT=fE79vyZKQU5g@mail.gmail.com>
	<CADJHv_s1-P20E=m+tWMYtWF-vJjcsEC3jq4Qd7seLxFJebgX2g@mail.gmail.com>
	<CADJHv_tfZRPtXqxTG-cnkXx=BQjq-danJQ0Q-rZZwS8PeCr_Eg@mail.gmail.com>
	<CANT5p=pdtZ0nNQYat6CJDqGQawiEnPAbST=1Q8JKs9GN9oA8nw@mail.gmail.com>
	<CADJHv_uZPY374k6vtbk2_VSC3YhejDT0fuuvyEJm6y2weqGLmg@mail.gmail.com>
	<3790640.1641819409@warthog.procyon.org.uk>
	<4126222.1641887321@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <4126222.1641887321@warthog.procyon.org.uk>
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
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cachefs@redhat.com,
	Murphy Zhou <jencce.kernel@gmail.com>, Steve French <smfrench@gmail.com>
Subject: Re: [Linux-cachefs] [ linux-next ] 20211206 tree cifs panic
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 11, 2022 at 07:48:41AM +0000, David Howells wrote:
> Murphy Zhou <jencce.kernel@gmail.com> wrote:
> 
> > Ya, 0110 tree passed all tests.
> > 
> > Thank you David!
> 
> Could I convert that into a Tested-by tag for my fscache-rewrite patch series?

Panic again in 0111 tree.

cthon04 on cifs panicking is blocking other tests to complete. Another
thing is that my tests are not targeting at fscache, just general fs
tests. I don't know if it counts.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

