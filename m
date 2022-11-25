Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 021FF638AC6
	for <lists+linux-cachefs@lfdr.de>; Fri, 25 Nov 2022 14:01:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669381307;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BuDJFK3XJQdJggXjVxTMDOkvotlr4hkAfSKnbYq5kWc=;
	b=gkhmBAXYew8w/FEJNgR+jdQxbeOSRRHhIah/RVouqjjlOCMDAZkH1bZNdIR4DXZDaGLfbf
	/Am9B+sWJD/AIVRUsrmnCIIvGMBngGhvjrf5oeheUZRaP6/uN+PkWyyuPmTV3nzpJ6drVM
	3omLF80hDgUCOja+95CVDoh/M//vYO8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-O0fCUaGmPRGssXMp5cerfw-1; Fri, 25 Nov 2022 08:01:41 -0500
X-MC-Unique: O0fCUaGmPRGssXMp5cerfw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 048E91C068D2;
	Fri, 25 Nov 2022 13:01:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E7CDC2166B46;
	Fri, 25 Nov 2022 13:01:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 95EA3194658F;
	Fri, 25 Nov 2022 13:01:39 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D613E1946587 for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 25 Nov 2022 13:01:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B1F5540C2088; Fri, 25 Nov 2022 13:01:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA37B40C2064
 for <linux-cachefs@redhat.com>; Fri, 25 Nov 2022 13:01:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FBD4884342
 for <linux-cachefs@redhat.com>; Fri, 25 Nov 2022 13:01:32 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-_hVUvdIGOLO_rJhqnLLhZA-1; Fri, 25 Nov 2022 08:01:28 -0500
X-MC-Unique: _hVUvdIGOLO_rJhqnLLhZA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D7B01623D2;
 Fri, 25 Nov 2022 13:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E731EC433C1;
 Fri, 25 Nov 2022 13:01:24 +0000 (UTC)
Date: Fri, 25 Nov 2022 21:01:21 +0800
From: Gao Xiang <xiang@kernel.org>
To: David Howells <dhowells@redhat.com>
Message-ID: <Y4C8ocemviAGpxRC@debian>
Mail-Followup-To: David Howells <dhowells@redhat.com>,
 Jingbo Xu <jefflexu@linux.alibaba.com>, jlayton@kernel.org,
 xiang@kernel.org, chao@kernel.org, linux-cachefs@redhat.com,
 linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20221124034212.81892-2-jefflexu@linux.alibaba.com>
 <20221124034212.81892-1-jefflexu@linux.alibaba.com>
 <2386961.1669377478@warthog.procyon.org.uk>
MIME-Version: 1.0
In-Reply-To: <2386961.1669377478@warthog.procyon.org.uk>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: Re: [Linux-cachefs] [PATCH v5 1/2] fscache,
 cachefiles: add prepare_ondemand_read() callback
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
Cc: chao@kernel.org, jlayton@kernel.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com, xiang@kernel.org,
 linux-erofs@lists.ozlabs.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi David,

On Fri, Nov 25, 2022 at 11:57:58AM +0000, David Howells wrote:
> Jingbo Xu <jefflexu@linux.alibaba.com> wrote:
> 
> > Add prepare_ondemand_read() callback dedicated for the on-demand read
> > scenario, so that callers from this scenario can be decoupled from
> > netfs_io_subrequest.
> > 
> > The original cachefiles_prepare_read() is now refactored to a generic
> > routine accepting a parameter list instead of netfs_io_subrequest.
> > There's no logic change, except that the debug id of subrequest and
> > request is removed from trace_cachefiles_prep_read().
> > 
> > Reviewed-by: Jeff Layton <jlayton@kernel.org>
> > Signed-off-by: Jingbo Xu <jefflexu@linux.alibaba.com>
> 
> Acked-by: David Howells <dhowells@redhat.com>

Thanks!  I will apply them for -next, and soon Jingbo will
submit large folios support for erofs iomap/fscache modes.

Thank all again,
Gao Xiang

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

