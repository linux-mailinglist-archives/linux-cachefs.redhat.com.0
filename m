Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 273BC3042AD
	for <lists+linux-cachefs@lfdr.de>; Tue, 26 Jan 2021 16:34:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611675288;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IGjSaRKsZBCJrMqpZ7theyjLJ3lrywvfhT1hgXNFWWI=;
	b=iBAdX8KOk6hr1v1VIAfpSEx9A7LILByaarDVRneBl4KHYOEpxA51bhAx2R8GF55PG1JrSs
	QnFMjbB+H1Kc82TrbTUaEqVIJdFptGB8PMWyDM2sugl3ew9XIX4wcGx5sco1JAnP/fA2IG
	OPWRMtHBq23Cv9JODAFGlBPfP5iVRxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-135-sBUSma2kM7eMM7wDvzl1bw-1; Tue, 26 Jan 2021 10:34:46 -0500
X-MC-Unique: sBUSma2kM7eMM7wDvzl1bw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FAC98144E0;
	Tue, 26 Jan 2021 15:34:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC6B25D9C2;
	Tue, 26 Jan 2021 15:34:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 95F38180954D;
	Tue, 26 Jan 2021 15:34:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QFYe2k016920 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 10:34:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8F3952026D48; Tue, 26 Jan 2021 15:34:40 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B22A2026D49
	for <linux-cachefs@redhat.com>; Tue, 26 Jan 2021 15:34:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 082D9811E86
	for <linux-cachefs@redhat.com>; Tue, 26 Jan 2021 15:34:38 +0000 (UTC)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
	[209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-598-gKoTPoJsMce9jSzZxIC4uw-1; Tue, 26 Jan 2021 10:34:36 -0500
X-MC-Unique: gKoTPoJsMce9jSzZxIC4uw-1
Received: by mail-ed1-f70.google.com with SMTP id u19so9055367edr.1
	for <linux-cachefs@redhat.com>; Tue, 26 Jan 2021 07:34:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=+sg4yNwZrAUtqGjsjAIZF/lC9W6Hi56SguvTv3qRusA=;
	b=nCBIEl3My6vv03jwLGJRuGQUsdGOdLD7orDR9qjz3z6f2WSnryWPP3gP8pw70+iISZ
	3C+V4KH5sgc4DcaaBwRFA/TmVrZgQm9CSQzeszMsGATn/R3EOWRFKD71KIDAw/Tru8UI
	BYHD2VXFVsfyeo7hTrXO8RlNFs3y9b8pcT05+6QwL03Pf8F7WijjCL1XDWD2HGuyGfp+
	QdTMi7NmCOpHE9E97/jNzHLslvW4EznHp9l2HLFiNgNHyKjRYbppYRTIRBGudzDYew/g
	+mjnRMXye9gf9BminGd0erBwDbwF3xBC5VxSmz3hbs/0HLq+w9JZioeLXRReQ0/FIxxZ
	AvYA==
X-Gm-Message-State: AOAM530lGR+aspx81oLzrjpnB1SllZVvy39sW3YH+tgrMWSTET/WBFa8
	y9bv5xZWJALnYeYzvWcuIn93v8wFlGi93YziE1mDn4en8TlKdXPGCSxwBWqy7xOOQz7CkP/6WFf
	TJcd+TuAg64zbs78Utn0E4EnCx33aSPBLMqtykA==
X-Received: by 2002:a17:906:4451:: with SMTP id
	i17mr2289499ejp.436.1611675275259; 
	Tue, 26 Jan 2021 07:34:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSasZks4PL3NUJQfxg7We8UW4x28G54NbjOgDuCVAFpi7QKXrub9Pz5L3G6Ovg3Un+JLmrv6pQRbddbpD7RMI=
X-Received: by 2002:a17:906:4451:: with SMTP id
	i17mr2289493ejp.436.1611675275099; 
	Tue, 26 Jan 2021 07:34:35 -0800 (PST)
MIME-Version: 1.0
References: <161161025063.2537118.2009249444682241405.stgit@warthog.procyon.org.uk>
	<161161054970.2537118.5401048451896267742.stgit@warthog.procyon.org.uk>
	<20210126035928.GJ308988@casper.infradead.org>
In-Reply-To: <20210126035928.GJ308988@casper.infradead.org>
From: David Wysochanski <dwysocha@redhat.com>
Date: Tue, 26 Jan 2021 10:33:59 -0500
Message-ID: <CALF+zOkNMHjtH+cZrGQFqbH5dD5gUpV+y3k-Bt31E35d4kn1oA@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
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
Subject: Re: [Linux-cachefs] [PATCH 25/32] NFS: Clean up nfs_readpage() and
	nfs_readpages()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 25, 2021 at 11:01 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Jan 25, 2021 at 09:35:49PM +0000, David Howells wrote:
> > -int nfs_readpage(struct file *file, struct page *page)
> > +int nfs_readpage(struct file *filp, struct page *page)
>
> I appreciate we're inconsistent between file and filp, but we're actually
> moving more towards file than filp.
>
Got it, easy enough to change.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

