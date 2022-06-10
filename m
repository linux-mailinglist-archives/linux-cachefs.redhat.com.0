Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4381F5460BF
	for <lists+linux-cachefs@lfdr.de>; Fri, 10 Jun 2022 11:03:24 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-ro7TjG0fOCiK5q8TECYCgw-1; Fri, 10 Jun 2022 05:03:20 -0400
X-MC-Unique: ro7TjG0fOCiK5q8TECYCgw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BBE783C1618D;
	Fri, 10 Jun 2022 09:03:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 491144216002;
	Fri, 10 Jun 2022 09:03:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 078891947042;
	Fri, 10 Jun 2022 09:03:18 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 6EDDF19466DF for <linux-cachefs@listman.corp.redhat.com>;
 Fri, 10 Jun 2022 09:03:16 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 46BEC111F3D9; Fri, 10 Jun 2022 09:03:16 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A72D1121319
 for <linux-cachefs@redhat.com>; Fri, 10 Jun 2022 09:03:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B891A1C16B5D
 for <linux-cachefs@redhat.com>; Fri, 10 Jun 2022 09:03:15 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
 (out30-131.freemail.mail.aliyun.com [115.124.30.131]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-pB5H9YveO5WbhJzo8WmNqw-1; Fri, 10 Jun 2022 05:03:12 -0400
X-MC-Unique: pB5H9YveO5WbhJzo8WmNqw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R301e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=hsiangkao@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
 TI=SMTPD_---0VFyY9Pu_1654851787
Received: from B-P7TQMD6M-0146.local(mailfrom:hsiangkao@linux.alibaba.com
 fp:SMTPD_---0VFyY9Pu_1654851787) by smtp.aliyun-inc.com;
 Fri, 10 Jun 2022 17:03:08 +0800
Date: Fri, 10 Jun 2022 17:03:06 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: Jia Zhu <zhujia.zj@bytedance.com>, David Howells <dhowells@redhat.com>
Message-ID: <YqMIyn7TgV1mVkiR@B-P7TQMD6M-0146.local>
References: <1a03d5de-e0cf-b23d-b12a-f46795125968@bytedance.com>
 <b62a09fc-a42c-72b5-eb42-37b52b3d529f@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <b62a09fc-a42c-72b5-eb42-37b52b3d529f@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [Linux-cachefs] [PATCH] cachefiles: narrow the scope of flushed
 requests when releasing fd
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
Cc: linux-cachefs@redhat.com, linux-erofs@lists.ozlabs.org, chao@kernel.org,
 yinxin.x@bytedance.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 09, 2022 at 04:54:10PM +0800, Jia Zhu wrote:
> 
> When an anonymous fd is released, only flush the requests
> associated with it, rather than all of requests in xarray.
> 
> Fixes: 9032b6e8589f ("cachefiles: implement on-demand read")
> Signed-off-by: Jia Zhu <zhujia.zj@bytedance.com>

Looks good to me, thanks for catching this!

Reviewed-by: Gao Xiang <hsiangkao@linux.alibaba.com>

Hi David,

Could you apply this patch to your tree? I think it'd be much better
to have cachefiles patches via your tree as long as no code coupling..

Thanks a lot!

Thanks,
Gao Xiang


> ---
>  fs/cachefiles/ondemand.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
> index a41ae6efc545..1fee702d5529 100644
> --- a/fs/cachefiles/ondemand.c
> +++ b/fs/cachefiles/ondemand.c
> @@ -21,7 +21,8 @@ static int cachefiles_ondemand_fd_release(struct inode
> *inode,
>  	 * anon_fd.
>  	 */
>  	xas_for_each(&xas, req, ULONG_MAX) {
> -		if (req->msg.opcode == CACHEFILES_OP_READ) {
> +		if (req->msg.object_id == object_id &&
> +		    req->msg.opcode == CACHEFILES_OP_READ) {
>  			req->error = -EIO;
>  			complete(&req->done);
>  			xas_store(&xas, NULL);
> -- 
> 2.20.1
> 

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

