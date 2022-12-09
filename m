Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF2664819D
	for <lists+linux-cachefs@lfdr.de>; Fri,  9 Dec 2022 12:27:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670585220;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1c1xKZMFD3Md201uJIXxVtUOOcamfvTMQG7oJ12Asio=;
	b=Oo8pl2UUZ/jOgqMFCIltDuNC0uRBxHxVaxZq1fvW73f8dv/mJRNsbVDvoOJ1EUG7Gbu6lD
	V2IsB8SGpH9uA6kUpm/4bRz1ya/f5BArFjzewemtses73gIQHpGeOLjtejtWFHO2m0gaoB
	HTkIxTtGJ4F28d9DNw/vtpr3XNjLpSU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-307-Y_Uma73uMWqASZLgkhABtg-1; Fri, 09 Dec 2022 06:26:57 -0500
X-MC-Unique: Y_Uma73uMWqASZLgkhABtg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 305C585A5A6;
	Fri,  9 Dec 2022 11:26:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 274CE200BA9B;
	Fri,  9 Dec 2022 11:26:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 02BD01946A7E;
	Fri,  9 Dec 2022 11:26:57 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4E4C91946A72 for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  9 Dec 2022 11:26:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 29FD440C6EC3; Fri,  9 Dec 2022 11:26:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5FA640C6EC2;
 Fri,  9 Dec 2022 11:26:53 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <42b33792-50e9-77d7-4d3e-ac5ce1adeda6@huaweicloud.com>
References: <42b33792-50e9-77d7-4d3e-ac5ce1adeda6@huaweicloud.com>
 <20221128031929.3918348-1-houtao@huaweicloud.com>
To: Hou Tao <houtao@huaweicloud.com>
MIME-Version: 1.0
Date: Fri, 09 Dec 2022 11:26:51 +0000
Message-ID: <2308529.1670585211@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [Linux-cachefs] [PATCH] fscache: Use wake_up_var() to wake up
 pending volume acquisition
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-cachefs@redhat.com, "houtao1@huawei.com" <houtao1@huawei.com>,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2308528.1670585211.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hou Tao <houtao@huaweicloud.com> wrote:

> >  			clear_bit(FSCACHE_VOLUME_ACQUIRE_PENDING, &cursor->flags);

Maybe this should be clear_bit_unlock() instead.

And I wonder if:

	set_bit(FSCACHE_VOLUME_ACQUIRE_PENDING, &candidate->flags);

in fscache_hash_volume() needs a barrier before it.

> > -			wake_up_bit(&cursor->flags, FSCACHE_VOLUME_ACQUIRE_PENDING);
> > +			/*
> > +			 * Paired with barrier in wait_var_event(). Check
> > +			 * waitqueue_active() and wake_up_var() for details.
> > +			 */
> > +			smp_mb__after_atomic();
> > +			wake_up_var(&cursor->flags);

That doesn't seem right.

wake_up_bit() is more selective, so should be preferred to wake_up_var().

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

