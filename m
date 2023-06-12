Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E609172B85C
	for <lists+linux-cachefs@lfdr.de>; Mon, 12 Jun 2023 08:56:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686553012;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cBbP/T+jMUw+zW70uHoWxcRHlae27E4T+yVqF7CvMUs=;
	b=XnuBzaX0+TmDuU8Ty5V4ADPgFB5U7uJnKiKpmYL+sp4A+fYpHpBbrdqMMcMZbu2bs68vVH
	xmssWBb0Df/KlEByFlONYwjdQMZqV+TPNoB/NrbQ/lr12PSmuDi8AdK7YXDaJRTfqxR4pB
	5Ot76UEAhBRCUBS2zcpLNzGIdUqW42Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-1Mpx-WQ_Mxu1_PB5HHhtmA-1; Mon, 12 Jun 2023 02:56:49 -0400
X-MC-Unique: 1Mpx-WQ_Mxu1_PB5HHhtmA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9875800888;
	Mon, 12 Jun 2023 06:56:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F62410BDF;
	Mon, 12 Jun 2023 06:56:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id F2F3E19465A8;
	Mon, 12 Jun 2023 06:56:47 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 888E4194658C for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 12 Jun 2023 06:56:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 24E0D492C38; Mon, 12 Jun 2023 06:56:46 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E056492C1B
 for <linux-cachefs@redhat.com>; Mon, 12 Jun 2023 06:56:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F39172A59562
 for <linux-cachefs@redhat.com>; Mon, 12 Jun 2023 06:56:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-ssu1zwKvPnermi_QjvhJCw-1; Mon, 12 Jun 2023 02:56:43 -0400
X-MC-Unique: ssu1zwKvPnermi_QjvhJCw-1
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1q8aqF-002kBQ-0T; Mon, 12 Jun 2023 06:15:51 +0000
Date: Sun, 11 Jun 2023 23:15:51 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <ZIa4FwIIqmn0vqYy@infradead.org>
References: <20230611132732.1502040-1-amir73il@gmail.com>
 <20230611132732.1502040-2-amir73il@gmail.com>
 <ZIaelQAs0EjPw4TR@infradead.org>
 <CAOQ4uxhNtnzpxUzfxjCJ3_7afCG1ye-pHViHjGi8asXTR_Cm3w@mail.gmail.com>
 <ZIa3DfH9D0BIBf8G@infradead.org>
MIME-Version: 1.0
In-Reply-To: <ZIa3DfH9D0BIBf8G@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: Re: [Linux-cachefs] [PATCH v2 1/3] fs: rename FMODE_NOACCOUNT to
 FMODE_INTERNAL
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
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-unionfs@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, linux-cachefs@redhat.com,
 Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: infradead.org
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jun 11, 2023 at 11:11:25PM -0700, Christoph Hellwig wrote:
> On Mon, Jun 12, 2023 at 09:08:37AM +0300, Amir Goldstein wrote:
> > Well, I am not sure if FMODE_FAKE_PATH in v3 is a better name,
> > because you did rightfully say that "fake path" is not that descriptive,
> > but I will think of a better way to describe "fake path" and match the
> > flag to the file container name.
> 
> I suspect the just claling it out what it is and naming it
> FMODE_OVERLAYFS might be a good idea.  We'd just need to make sure not
> to set it for the cachefiles use case, which is probably a good idea
> anyway.

Adding Dave:

not sure if I'm missing something, but is there any good reason
cachefs doesn't juse use dentry_open() ?

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

