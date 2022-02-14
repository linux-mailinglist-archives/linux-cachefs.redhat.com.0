Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DA84B559F
	for <lists+linux-cachefs@lfdr.de>; Mon, 14 Feb 2022 17:08:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644854917;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ytE9bmO9fbRX/IgWKjkVyO3TvvYBg52dkNk8LBa9jUE=;
	b=KNrNvI+0eSdsw+kWn97EHFiXvc22LGPGtgB5XT2iST9BNFagR9kIWu4W7t1DxVG+84YAZ8
	N6V1osKrWAkCD7gDUXA5w2xtYVJkKeFYUct3QjXqFWmB8+hsy6yNnMrkkQ4sZNYKJlFabd
	X0N7s1AnONAn66pswuEuAViRsJor7PY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-EVlY_ZATNoCNeJJv71Yoyg-1; Mon, 14 Feb 2022 11:08:36 -0500
X-MC-Unique: EVlY_ZATNoCNeJJv71Yoyg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43CCC1006AA4;
	Mon, 14 Feb 2022 16:08:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2E8E7ACE0;
	Mon, 14 Feb 2022 16:08:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A32C71809CB8;
	Mon, 14 Feb 2022 16:08:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21EG6rJ1022971 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 14 Feb 2022 11:06:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1BB027574C; Mon, 14 Feb 2022 16:06:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.37.94])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0DBC475746;
	Mon, 14 Feb 2022 16:06:15 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <CACdtm0bi4O36cif-iwarBb2oNOj-qjECr0iPAHK821E07u7p8A@mail.gmail.com>
References: <CACdtm0bi4O36cif-iwarBb2oNOj-qjECr0iPAHK821E07u7p8A@mail.gmail.com>
	<164311902471.2806745.10187041199819525677.stgit@warthog.procyon.org.uk>
	<164311907995.2806745.400147335497304099.stgit@warthog.procyon.org.uk>
To: Rohith Surabattula <rohiths.msft@gmail.com>
MIME-Version: 1.0
Date: Mon, 14 Feb 2022 16:06:15 +0000
Message-ID: <2976358.1644854775@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: linux-cachefs@redhat.com
Cc: nspmangalore@gmail.com, linux-cifs@vger.kernel.org, jlayton@kernel.org,
	smfrench@gmail.com, linux-cachefs@redhat.com, linux-fsdevel@vger.kernel.org
Subject: Re: [Linux-cachefs] [RFC PATCH 3/7] cifs: Change the I/O paths to
	use an iterator rather than a page list
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
Content-ID: <2976357.1644854775.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rohith Surabattula <rohiths.msft@gmail.com> wrote:

> After copying the buf to the XArray iterator, "got_bytes" field is not
> updated. As a result, the read of data which is less than page size
> failed.
> Below is the patch to fix the above issue.

Okay, I've folded that in, thanks.

David

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

