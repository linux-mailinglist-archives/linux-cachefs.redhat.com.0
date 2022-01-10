Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5160A4890AB
	for <lists+linux-cachefs@lfdr.de>; Mon, 10 Jan 2022 08:21:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641799275;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZVu/ShbbaAxRcBUNWg2Rxuat+5cAXsVWmwQAn5E3QBY=;
	b=C8iO2bri87mPpiFc9ebTreeEysL0Vx3q+d7gFkm4FdrT9WUlArBFXDisbfFy4pLENLVapM
	I+ugFHBd4RB4fiQXwBqc33FHjCAxbd9I0F5mhH06gLqZu8XzxgrYAgFLtrz1vVYZejoyHI
	NyrEinpKpUhEjCvnlNmoFA0irsRghLg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-nS57SCpxOJCkwqheyXEPFA-1; Mon, 10 Jan 2022 02:21:12 -0500
X-MC-Unique: nS57SCpxOJCkwqheyXEPFA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AADFB81CCB5;
	Mon, 10 Jan 2022 07:21:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2347B4EC8A;
	Mon, 10 Jan 2022 07:21:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9915F4BB7C;
	Mon, 10 Jan 2022 07:21:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20A7L5b3012243 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 10 Jan 2022 02:21:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5CAC85F4ED; Mon, 10 Jan 2022 07:21:05 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 837EB5F4EA;
	Mon, 10 Jan 2022 07:21:01 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220110052313.ax6ory7xaevbttoe@xzhoux.usersys.redhat.com>
References: <20220110052313.ax6ory7xaevbttoe@xzhoux.usersys.redhat.com>
	<CADJHv_u3bqj82sFUWT=JJBWd1kjc14FUbVBd_9r18cMQOeudJw@mail.gmail.com>
	<CANT5p=rjTGNu2WooxRcu4JMM9wSyYY6S3kXtdfQ5caj1WnAEOA@mail.gmail.com>
	<CANT5p=pW1t5ggVsrMgNWi+CBpym5XXQ1dSwm-eH=vpczmL_nTg@mail.gmail.com>
	<CANT5p=oQeR90LPJKRUJ6eF+ti3Mefs48FfasT=fE79vyZKQU5g@mail.gmail.com>
	<CADJHv_s1-P20E=m+tWMYtWF-vJjcsEC3jq4Qd7seLxFJebgX2g@mail.gmail.com>
	<CADJHv_tfZRPtXqxTG-cnkXx=BQjq-danJQ0Q-rZZwS8PeCr_Eg@mail.gmail.com>
	<CANT5p=pdtZ0nNQYat6CJDqGQawiEnPAbST=1Q8JKs9GN9oA8nw@mail.gmail.com>
	<CADJHv_uZPY374k6vtbk2_VSC3YhejDT0fuuvyEJm6y2weqGLmg@mail.gmail.com>
To: Murphy Zhou <jencce.kernel@gmail.com>
MIME-Version: 1.0
Date: Mon, 10 Jan 2022 07:21:00 +0000
Message-ID: <3653699.1641799260@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 20A7L5b3012243
X-loop: linux-cachefs@redhat.com
Cc: Shyam Prasad N <nspmangalore@gmail.com>, linux-cachefs@redhat.com,
	Steve French <smfrench@gmail.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3653698.1641799260.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Murphy Zhou <jencce.kernel@gmail.com> wrote:

>   574146fe263a Merge branch 'fscache-next' of git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git

Can you tell me what the commit of the merged branch is? (not the merge
itself).  I merged some fixes in to the cifs patch but I don't know if
linux-next would have picked them up in that merge.

https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=fscache-next
commit 5e4fdf49a2a0375384038f3ecabd90af3d4cf71f at the top.

Also, do you have a simple reproducer by any chance?

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

