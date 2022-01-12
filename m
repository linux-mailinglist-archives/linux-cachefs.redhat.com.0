Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 941A648BED9
	for <lists+linux-cachefs@lfdr.de>; Wed, 12 Jan 2022 08:10:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641971413;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=W6JwRhezPNcYf2DUyriNJM1HsPRno5Cts5iy105rtgE=;
	b=CE1qlJbyGHVK7Y4oR6xOvTRwGTvw5bvbSHFvshkEXNFuU92vzDD3uqT6INLP1iv5U2Z8Sz
	af/+9cur5qtE/3edHbbkztQ8uNcba9NMxB/i2SGTTH7SxZh4hsJpEfkEDFhfaw+dcVHWb7
	zhDm9tnWRO0KJ26ABulpVqm6oosPmCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-bOAjpAsrMMSieg9189V8Dg-1; Wed, 12 Jan 2022 02:10:10 -0500
X-MC-Unique: bOAjpAsrMMSieg9189V8Dg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 128B91006AA3;
	Wed, 12 Jan 2022 07:10:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38BC479595;
	Wed, 12 Jan 2022 07:10:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C5561806D1C;
	Wed, 12 Jan 2022 07:10:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20C7A35n010051 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 12 Jan 2022 02:10:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 31C727B03F; Wed, 12 Jan 2022 07:10:03 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4387B7B028;
	Wed, 12 Jan 2022 07:09:59 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CADJHv_uZe3UaO3Ei6vP1o5C2Pcasr6UCiiBvs7F_KV2731V0pQ@mail.gmail.com>
References: <CADJHv_uZe3UaO3Ei6vP1o5C2Pcasr6UCiiBvs7F_KV2731V0pQ@mail.gmail.com>
	<CADJHv_u3bqj82sFUWT=JJBWd1kjc14FUbVBd_9r18cMQOeudJw@mail.gmail.com>
	<CANT5p=rjTGNu2WooxRcu4JMM9wSyYY6S3kXtdfQ5caj1WnAEOA@mail.gmail.com>
	<CANT5p=pW1t5ggVsrMgNWi+CBpym5XXQ1dSwm-eH=vpczmL_nTg@mail.gmail.com>
	<CANT5p=oQeR90LPJKRUJ6eF+ti3Mefs48FfasT=fE79vyZKQU5g@mail.gmail.com>
	<CADJHv_s1-P20E=m+tWMYtWF-vJjcsEC3jq4Qd7seLxFJebgX2g@mail.gmail.com>
	<CADJHv_tfZRPtXqxTG-cnkXx=BQjq-danJQ0Q-rZZwS8PeCr_Eg@mail.gmail.com>
	<CANT5p=pdtZ0nNQYat6CJDqGQawiEnPAbST=1Q8JKs9GN9oA8nw@mail.gmail.com>
	<CADJHv_uZPY374k6vtbk2_VSC3YhejDT0fuuvyEJm6y2weqGLmg@mail.gmail.com>
	<3790640.1641819409@warthog.procyon.org.uk>
	<4126222.1641887321@warthog.procyon.org.uk>
	<20220111141305.56z36gaogt72kwja@xzhoux.usersys.redhat.com>
	<491547.1641939439@warthog.procyon.org.uk>
To: Murphy Zhou <jencce.kernel@gmail.com>
MIME-Version: 1.0
Date: Wed, 12 Jan 2022 07:09:58 +0000
Message-ID: <533955.1641971398@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <533954.1641971398.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Murphy Zhou <jencce.kernel@gmail.com> wrote:

> With this patch on 0111 tree, the panic is gone.

Thanks!

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

