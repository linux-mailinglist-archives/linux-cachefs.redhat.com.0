Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4475B666002
	for <lists+linux-cachefs@lfdr.de>; Wed, 11 Jan 2023 17:06:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673453182;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=02mg8zlHI4w/vQ008hNUlqvn+cydHVnx1irFuMhFUms=;
	b=OQjw7nJR84dyhafysFYpRoiMd7HlBRspVSOWTLaembSphqvNXTqmynTfaSYsfRIS1/P6Hw
	zkp1InyCh9EFS3jIdNTAnIam+bKVjDYRoNo09N0vL3ch0ufP1TVKq7v6fq/TB3I67BILXz
	M6MpSABnFOc0WJlMM8RBpHSCNVUgfNs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-401-lFeixFYHNzikfF0yveDlHw-1; Wed, 11 Jan 2023 11:06:19 -0500
X-MC-Unique: lFeixFYHNzikfF0yveDlHw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03A3038012CE;
	Wed, 11 Jan 2023 16:06:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6B0B22166B26;
	Wed, 11 Jan 2023 16:06:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4F0D019465B5;
	Wed, 11 Jan 2023 16:06:14 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E137C19465A3 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 11 Jan 2023 16:06:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id CF57DC16032; Wed, 11 Jan 2023 16:06:13 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.87])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A4AEC15BA0;
 Wed, 11 Jan 2023 16:06:11 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20221226103309.953112-2-houtao@huaweicloud.com>
References: <20221226103309.953112-2-houtao@huaweicloud.com>
 <20221226103309.953112-1-houtao@huaweicloud.com>
To: Hou Tao <houtao@huaweicloud.com>
MIME-Version: 1.0
Date: Wed, 11 Jan 2023 16:06:10 +0000
Message-ID: <2431838.1673453170@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: Re: [Linux-cachefs] [PATCH v2 1/2] fscache: Use wait_on_bit() to
 wait for the freeing of relinquished volume
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
 linux-cachefs@redhat.com, houtao1@huawei.com, linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-ID: <2431837.1673453170.1@warthog.procyon.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hou Tao <houtao@huaweicloud.com> wrote:

>  			clear_bit(FSCACHE_VOLUME_ACQUIRE_PENDING, &cursor->flags);
> +			/*
> +			 * Paired with barrier in wait_on_bit(). Check
> +			 * wake_up_bit() and waitqueue_active() for details.
> +			 */
> +			smp_mb__after_atomic();
>  			wake_up_bit(&cursor->flags, FSCACHE_VOLUME_ACQUIRE_PENDING);

What two values are you applying a partial ordering to?

David
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

