Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A9B48AF4E
	for <lists+linux-cachefs@lfdr.de>; Tue, 11 Jan 2022 15:17:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1641910623;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wovZ3TNGEZ7uMZ7AhNilGlYaSLiUqFSpdM38vaGtg3Y=;
	b=QI42gL9DfBbqK8YMwreUPE+0iRFQ73NLG0WTYBQOasmoWH/l1V92tT6+iyNF/mAZh1UWzQ
	+2q3+UVTebwBp7JITgreAys01Cn8alSVViZaVv6YyK8egbfSPcBj/i/m5g9ViyR2fv3d2B
	UtlyRBr1yEo9D22xrW43pp8wyDcImbc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-7AfXEQCbN_-YTNJ3At-bPw-1; Tue, 11 Jan 2022 09:17:00 -0500
X-MC-Unique: 7AfXEQCbN_-YTNJ3At-bPw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFD1D1F2DA;
	Tue, 11 Jan 2022 14:16:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF8E57E419;
	Tue, 11 Jan 2022 14:16:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 860B84BB7C;
	Tue, 11 Jan 2022 14:16:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20BEGt1E022965 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 11 Jan 2022 09:16:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EABB57EBE1; Tue, 11 Jan 2022 14:16:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.165])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C73147E913;
	Tue, 11 Jan 2022 14:16:51 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20220111141305.56z36gaogt72kwja@xzhoux.usersys.redhat.com>
References: <20220111141305.56z36gaogt72kwja@xzhoux.usersys.redhat.com>
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
To: Murphy Zhou <jencce.kernel@gmail.com>
MIME-Version: 1.0
Date: Tue, 11 Jan 2022 14:16:50 +0000
Message-ID: <198089.1641910610@warthog.procyon.org.uk>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <198088.1641910610.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Murphy Zhou <jencce.kernel@gmail.com> wrote:

> Panic again in 0111 tree.

Same panic, or different?

Can you repaste the oops message?  It's a bit difficult to go through when
it's embedded a number of quotes deep in a message.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

