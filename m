Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0496D60F86F
	for <lists+linux-cachefs@lfdr.de>; Thu, 27 Oct 2022 15:07:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666876023;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=U1YciIc1mZtdAlehHuG8buxzdnXhrYj63OQVm9fH/dU=;
	b=e1BH4a4KezlVZLqVh3euxFFxYJYBLU0tiiNB2+zft0VrQALdMbEBSJW+Z6Z01/flJoFiRm
	/UXg+zhUjYpIOSqNv+r7q3VfsKoE0nUIiTj4RpzhYUmd0+l9WBxLUX41aVIu8k5FSaJ5CV
	n2bwcmf5T+s+POnsVDhMZHs28t3BRJw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-o85jMZiYMhmgDcesCIcncg-1; Thu, 27 Oct 2022 09:07:03 -0400
X-MC-Unique: o85jMZiYMhmgDcesCIcncg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 62501185A7A8;
	Thu, 27 Oct 2022 13:07:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5918CC15BA8;
	Thu, 27 Oct 2022 13:07:02 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 40191194704E;
	Thu, 27 Oct 2022 13:07:02 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 1B5821946597 for <linux-cachefs@listman.corp.redhat.com>;
 Thu, 27 Oct 2022 13:06:56 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0B0A51121333; Thu, 27 Oct 2022 13:06:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.73])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD7081121325;
 Thu, 27 Oct 2022 13:06:54 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20221027083547.46933-4-jefflexu@linux.alibaba.com>
References: <20221027083547.46933-4-jefflexu@linux.alibaba.com>
 <20221027083547.46933-1-jefflexu@linux.alibaba.com>
To: Jingbo Xu <jefflexu@linux.alibaba.com>
MIME-Version: 1.0
Date: Thu, 27 Oct 2022 14:06:54 +0100
Message-ID: <3306327.1666876014@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: Re: [Linux-cachefs] [PATCH 3/9] fscache,
 netfs: rename netfs_io_terminated_t as fscache_io_terminated_t
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
Cc: linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-afs@lists.infradead.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <3306326.1666876014.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Jingbo Xu <jefflexu@linux.alibaba.com> wrote:

> Rename netfs_io_terminated_t as fscache_io_terminated_t to make raw
> fscache APIs more neutral independent on libnetfs.

Please don't.  This is a netfslib feature that happens to be used by fscache.

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

