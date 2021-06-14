Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B67013A6000
	for <lists+linux-cachefs@lfdr.de>; Mon, 14 Jun 2021 12:25:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623666325;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tM9wEAINAokBNJok/5ruMCWc8RVgeqa/2rgYM7+ZjU4=;
	b=gkzDk3UCi6ERxwCGprpIgEhYrbma+wbCXTT0qi3Vs3sccBR5jKDdgIeSfn4wOBghTJTQ7H
	nvmO5Fgs3HGA2zYloMqSpSSa7A8Majcr6uqsEBjxwra1Pspvcngup7Rrga6vbWnXsaaDM8
	ysjap9dTVSGpY4Jxq3hrLyFcrV1ozps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-tPLqNWOlPDqTd7rg0M1FiA-1; Mon, 14 Jun 2021 06:25:24 -0400
X-MC-Unique: tPLqNWOlPDqTd7rg0M1FiA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABA6B1084F4A;
	Mon, 14 Jun 2021 10:25:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93CD85D9D3;
	Mon, 14 Jun 2021 10:25:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B4771809CAF;
	Mon, 14 Jun 2021 10:25:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15EAJiQA014400 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 14 Jun 2021 06:19:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5C4EE34B2C; Mon, 14 Jun 2021 10:19:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (ovpn-118-65.rdu2.redhat.com
	[10.10.118.65])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A2B5619C45;
	Mon, 14 Jun 2021 10:19:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <338981.1623665093@warthog.procyon.org.uk>
References: <338981.1623665093@warthog.procyon.org.uk>
	<20210613233345.113565-1-jlayton@kernel.org>
MIME-Version: 1.0
Date: Mon, 14 Jun 2021 11:19:38 +0100
Message-ID: <340611.1623665978@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
Cc: Andrew W Elble <aweits@rit.edu>, Jeff Layton <jlayton@kernel.org>,
	willy@infradead.org, linux-cachefs@redhat.com, pfmeec@rit.edu,
	idryomov@gmail.com, ceph-devel@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH] netfs: fix test for whether we can skip
	read when writing beyond EOF
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
X-Mimecast-Spam-Score: 2
X-Mimecast-Originator: redhat.com
Content-ID: <340610.1623665978.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David Howells <dhowells@redhat.com> wrote:

> > +	zero_user_segments(page, 0, offset, offset + len, thp_size(page));
> 
> If you're going to leave a hole in the file, this will break afs, so this
> patch needs to deal with that too (basically if copied < len, then the
> remainder needs clearing, give or take len being trimmed to the end of the
> page).  I can look at adding that.

Clearing or reading.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

