Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C687CAE81
	for <lists+linux-cachefs@lfdr.de>; Mon, 16 Oct 2023 18:09:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697472578;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0YU4bNkzpRo0hyAGoU5FS0YOvcbs0nJJfvUtomyyOTU=;
	b=XiM1iT93Ddwiv3RZJWj4qakFN+Q0pI/oSR25vqc+qLvRnY6LYpAEGMSPFg6xO9J8lC0K0e
	4x3/LWtR8eF+h9f7fxEndaQfwPFK51nl1dbOH/ZWuw8UQckJrSmTRMM99WPO+aJuJWuDFt
	eGECet+BGkRbgNn88P9KAcbL4Ck69lM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-sayQynL7OGSL3JXTQneeZg-1; Mon, 16 Oct 2023 12:09:35 -0400
X-MC-Unique: sayQynL7OGSL3JXTQneeZg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18117182D3CE;
	Mon, 16 Oct 2023 16:09:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E6E21202B17E;
	Mon, 16 Oct 2023 16:09:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 950B2194658C;
	Mon, 16 Oct 2023 16:09:34 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 13D8B1946587 for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 16 Oct 2023 16:09:33 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D3B5211301CF; Mon, 16 Oct 2023 16:09:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F03C111D3DC;
 Mon, 16 Oct 2023 16:09:30 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <e1351696345351cb3d168fb41c54a1ef8ccf0b16.camel@kernel.org>
References: <e1351696345351cb3d168fb41c54a1ef8ccf0b16.camel@kernel.org>
 <20231013160423.2218093-1-dhowells@redhat.com>
 <20231013160423.2218093-10-dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
MIME-Version: 1.0
Date: Mon, 16 Oct 2023 17:09:29 +0100
Message-ID: <2840729.1697472569@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Linux-cachefs] [RFC PATCH 09/53] netfs: Implement
 unbuffered/DIO vs buffered I/O locking
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>, linux-cifs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-kernel@vger.kernel.org,
 Steve French <smfrench@gmail.com>, linux-cachefs@redhat.com,
 linux-mm@kvack.org, netdev@vger.kernel.org,
 Marc Dionne <marc.dionne@auristor.com>, v9fs@lists.linux.dev,
 Ilya Dryomov <idryomov@gmail.com>, linux-afs@lists.infradead.org,
 Christian Brauner <christian@brauner.io>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2840728.1697472569.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jeff Layton <jlayton@kernel.org> wrote:

> It's nice to see this go into common code, but why not go ahead and
> convert ceph (and possibly NFS) to use this? Is there any reason not to?

I'm converting ceph on a follow-on branch and for ceph this will be dealt with
there.

I could do NFS round about here, I suppose.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

