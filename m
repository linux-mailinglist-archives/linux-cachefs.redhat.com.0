Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6396F5F8484
	for <lists+linux-cachefs@lfdr.de>; Sat,  8 Oct 2022 11:06:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665219974;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZUw6L8FNGbDNyocsREKqTyHdZez0q3NXP4fS3rxnlnQ=;
	b=hCQ6lhLHys6B/ciH2wlSp49quyRkNdfXTfj7JyZdpLsnrjenrLIgbyzuZFLLT1IEOpyRiD
	uDNApgqsZojNfOe0aevD69Y1b3acd/n/W2jwJ4XyOVznw7sD+clfBQ1hT+a/56zBn6knx+
	mjcXWca9n8crqJNyDIZcA8vtxZ6ckJc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-204-yaFE7iu-MMSnWI7SeafKUw-1; Sat, 08 Oct 2022 05:06:10 -0400
X-MC-Unique: yaFE7iu-MMSnWI7SeafKUw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 36CF829AA3B5;
	Sat,  8 Oct 2022 09:06:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2AD1640EFB30;
	Sat,  8 Oct 2022 09:06:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EAC411946A51;
	Sat,  8 Oct 2022 09:06:09 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A2FF61946587 for <linux-cachefs@listman.corp.redhat.com>;
 Sat,  8 Oct 2022 09:06:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 81B514B3FCF; Sat,  8 Oct 2022 09:06:09 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A1F14B3FCE
 for <linux-cachefs@redhat.com>; Sat,  8 Oct 2022 09:06:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A1D0185A7A4
 for <linux-cachefs@redhat.com>; Sat,  8 Oct 2022 09:06:09 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com
 (out30-56.freemail.mail.aliyun.com [115.124.30.56]) by relay.mimecast.com
 with ESMTP with STARTTLS (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256)
 id us-mta-183-MnHzgbUeMkOgn6potuqjjA-1; Sat, 08 Oct 2022 05:06:01 -0400
X-MC-Unique: MnHzgbUeMkOgn6potuqjjA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046050;
 MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
 TI=SMTPD_---0VRbkoWW_1665219956
Received: from 30.221.130.66(mailfrom:jefflexu@linux.alibaba.com
 fp:SMTPD_---0VRbkoWW_1665219956) by smtp.aliyun-inc.com;
 Sat, 08 Oct 2022 17:05:58 +0800
Message-ID: <206e172c-5ba0-1233-f46d-edb828df53ad@linux.alibaba.com>
Date: Sat, 8 Oct 2022 17:05:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
To: Jia Zhu <zhujia.zj@bytedance.com>, dhowells@redhat.com, xiang@kernel.org
References: <20220818135204.49878-1-zhujia.zj@bytedance.com>
 <20220818135204.49878-4-zhujia.zj@bytedance.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
In-Reply-To: <20220818135204.49878-4-zhujia.zj@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: Re: [Linux-cachefs] [RFC PATCH 3/5] cachefiles: resend an open
 request if the read request's object is closed
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
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
 linux-erofs@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 8/18/22 9:52 PM, Jia Zhu wrote:
> When an anonymous fd is closed by user daemon, if there is a new read
> request for this file comes up, the anonymous fd should be re-opened
> to handle that read request rather than fail it directly.
> 
> 1. Introduce reopening state for objects that are closed but have
>    inflight/subsequent read requests.
> 2. No longer flush READ requests but only CLOSE requests when anonymous
>    fd is closed.
> 3. Enqueue the reopen work to workqueue, thus user daemon could get rid
>    of daemon_read context and handle that request smoothly. Otherwise,
>    the user daemon will send a reopen request and wait for itself to
>    process the request.
> 
> Signed-off-by: Jia Zhu <zhujia.zj@bytedance.com>
> Reviewed-by: Xin Yin <yinxin.x@bytedance.com>
> ---
>  fs/cachefiles/internal.h |  3 ++
>  fs/cachefiles/ondemand.c | 79 +++++++++++++++++++++++++++-------------
>  2 files changed, 56 insertions(+), 26 deletions(-)
> 
> diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
> index cdf4ec781933..66bbd4f1d22a 100644
> --- a/fs/cachefiles/internal.h
> +++ b/fs/cachefiles/internal.h
> @@ -48,9 +48,11 @@ struct cachefiles_volume {
>  enum cachefiles_object_state {
>  	CACHEFILES_ONDEMAND_OBJSTATE_close, /* Anonymous fd closed by daemon or initial state */
>  	CACHEFILES_ONDEMAND_OBJSTATE_open, /* Anonymous fd associated with object is available */
> +	CACHEFILES_ONDEMAND_OBJSTATE_reopening, /* Object that was closed and is being reopened. */
>  };
>  
>  struct cachefiles_ondemand_info {
> +	struct work_struct		work;
>  	int				ondemand_id;
>  	enum cachefiles_object_state	state;
>  	struct cachefiles_object	*object;
> @@ -341,6 +343,7 @@ cachefiles_ondemand_set_object_##_state(struct cachefiles_object *object) \
>  
>  CACHEFILES_OBJECT_STATE_FUNCS(open);
>  CACHEFILES_OBJECT_STATE_FUNCS(close);
> +CACHEFILES_OBJECT_STATE_FUNCS(reopening);
>  #else
>  #define CACHEFILES_ONDEMAND_OBJINFO(object)	NULL
>  
> diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
> index f51266554e4d..79ffb19380cd 100644
> --- a/fs/cachefiles/ondemand.c
> +++ b/fs/cachefiles/ondemand.c
> @@ -18,14 +18,10 @@ static int cachefiles_ondemand_fd_release(struct inode *inode,
>  	info->ondemand_id = CACHEFILES_ONDEMAND_ID_CLOSED;
>  	cachefiles_ondemand_set_object_close(object);
>  
> -	/*
> -	 * Flush all pending READ requests since their completion depends on
> -	 * anon_fd.
> -	 */
> -	xas_for_each(&xas, req, ULONG_MAX) {
> +	/* Only flush CACHEFILES_REQ_NEW marked req to avoid race with daemon_read */
> +	xas_for_each_marked(&xas, req, ULONG_MAX, CACHEFILES_REQ_NEW) {

Could you please add a more detailed comment here, explaing why flushing
CLOSE requests when anony fd gets closed is needed, and why the original
xas_for_each() would race with daemon_read()? There are some refs at [1]
and [2].

[1]
https://hackmd.io/YNsTQqLcQYOZ4gAlFWrNcA#flush-CLOSE-requests-when-anon-fd-is-closed
[2]
https://hackmd.io/YNsTQqLcQYOZ4gAlFWrNcA#race-between-readingflush-requests

The sequence chart is welcome to be added into the comment to explain
the race, or the code will be difficult to understand since the subtlety
of the race.


>  		if (req->msg.object_id == object_id &&
> -		    req->msg.opcode == CACHEFILES_OP_READ) {
> -			req->error = -EIO;
> +		    req->msg.opcode == CACHEFILES_OP_CLOSE) {
>  			complete(&req->done);
>  			xas_store(&xas, NULL);
>  		}
> @@ -175,6 +171,7 @@ int cachefiles_ondemand_copen(struct cachefiles_cache *cache, char *args)
>  	trace_cachefiles_ondemand_copen(req->object, id, size);
>  
>  	cachefiles_ondemand_set_object_open(req->object);
> +	wake_up_all(&cache->daemon_pollwq);
>  
>  out:
>  	complete(&req->done);
> @@ -234,6 +231,14 @@ static int cachefiles_ondemand_get_fd(struct cachefiles_req *req)
>  	return ret;
>  }
>  
> +static void ondemand_object_worker(struct work_struct *work)
> +{
> +	struct cachefiles_object *object =
> +		((struct cachefiles_ondemand_info *)work)->object;
> +
> +	cachefiles_ondemand_init_object(object);
> +}
> +
>  ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
>  					char __user *_buffer, size_t buflen)
>  {
> @@ -249,7 +254,27 @@ ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
>  	 * requests from being processed repeatedly.
>  	 */
>  	xa_lock(&cache->reqs);
> -	req = xas_find_marked(&xas, UINT_MAX, CACHEFILES_REQ_NEW);
> +	xas_for_each_marked(&xas, req, UINT_MAX, CACHEFILES_REQ_NEW) {
> +		/*
> +		 * Reopen the closed object with associated read request.
> +		 * Skip read requests whose related object are reopening.
> +		 */
> +		if (req->msg.opcode == CACHEFILES_OP_READ) {
> +			ret = cmpxchg(&CACHEFILES_ONDEMAND_OBJINFO(req->object)->state,
> +						  CACHEFILES_ONDEMAND_OBJSTATE_close,
> +						  CACHEFILES_ONDEMAND_OBJSTATE_reopening);
> +			if (ret == CACHEFILES_ONDEMAND_OBJSTATE_close) {
> +				INIT_WORK(&CACHEFILES_ONDEMAND_OBJINFO(req->object)->work,
> +						ondemand_object_worker);

How about initializing @work in cachefiles_ondemand_init_obj_info(), so
that the work_struct of each object only needs to be initialized once?


> +				queue_work(fscache_wq,
> +					&CACHEFILES_ONDEMAND_OBJINFO(req->object)->work);
> +				continue;
> +			} else if (ret == CACHEFILES_ONDEMAND_OBJSTATE_reopening) {
> +				continue;
> +			}
> +		}
> +		break;
> +	}
>  	if (!req) {
>  		xa_unlock(&cache->reqs);
>  		return 0;
> @@ -267,14 +292,18 @@ ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
>  	xa_unlock(&cache->reqs);
>  
>  	id = xas.xa_index;
> -	msg->msg_id = id;
>  
>  	if (msg->opcode == CACHEFILES_OP_OPEN) {
>  		ret = cachefiles_ondemand_get_fd(req);
> -		if (ret)
> +		if (ret) {
> +			cachefiles_ondemand_set_object_close(req->object);
>  			goto error;
> +		}
>  	}
>  
> +	msg->msg_id = id;
> +	msg->object_id = CACHEFILES_ONDEMAND_OBJINFO(req->object)->ondemand_id;
> +
>  	if (copy_to_user(_buffer, msg, n) != 0) {
>  		ret = -EFAULT;
>  		goto err_put_fd;
> @@ -307,19 +336,23 @@ static int cachefiles_ondemand_send_req(struct cachefiles_object *object,
>  					void *private)
>  {
>  	struct cachefiles_cache *cache = object->volume->cache;
> -	struct cachefiles_req *req;
> +	struct cachefiles_req *req = NULL;
>  	XA_STATE(xas, &cache->reqs, 0);
>  	int ret;
>  
>  	if (!test_bit(CACHEFILES_ONDEMAND_MODE, &cache->flags))
>  		return 0;
>  
> -	if (test_bit(CACHEFILES_DEAD, &cache->flags))
> -		return -EIO;
> +	if (test_bit(CACHEFILES_DEAD, &cache->flags)) {
> +		ret = -EIO;
> +		goto out;
> +	}
>  
>  	req = kzalloc(sizeof(*req) + data_len, GFP_KERNEL);
> -	if (!req)
> -		return -ENOMEM;
> +	if (!req) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
>  
>  	req->object = object;
>  	init_completion(&req->done);
> @@ -357,7 +390,7 @@ static int cachefiles_ondemand_send_req(struct cachefiles_object *object,
>  		/* coupled with the barrier in cachefiles_flush_reqs() */
>  		smp_mb();
>  
> -		if (opcode != CACHEFILES_OP_OPEN &&
> +		if (opcode == CACHEFILES_OP_CLOSE &&
>  			!cachefiles_ondemand_object_is_open(object)) {
>  			WARN_ON_ONCE(CACHEFILES_ONDEMAND_OBJINFO(object)->ondemand_id == 0);
>  			xas_unlock(&xas);
> @@ -382,8 +415,12 @@ static int cachefiles_ondemand_send_req(struct cachefiles_object *object,
>  	wake_up_all(&cache->daemon_pollwq);
>  	wait_for_completion(&req->done);
>  	ret = req->error;
> +	kfree(req);
> +	return ret;
>  out:
>  	kfree(req);
> +	if (opcode == CACHEFILES_OP_OPEN)
> +		cachefiles_ondemand_set_object_close(req->object);

Could you please add a comment here explaining why we need to set the
object state back to CLOSE state for OPEN (espectially reopening)
requests when error occured, and why we only set it back to CLOSE state
when error occured before the anony fd gets initialized? (That's because
when the error occures after the anony fd has been initialized, the
object will be reset to CLOSE state through
cachefiles_ondemand_fd_release() triggered by close_fd().) Or the code
is quite difficult to comprehend.


>  	return ret;
>  }
>  
> @@ -435,7 +472,6 @@ static int cachefiles_ondemand_init_close_req(struct cachefiles_req *req,
>  	if (!cachefiles_ondemand_object_is_open(object))
>  		return -ENOENT;
>  
> -	req->msg.object_id = CACHEFILES_ONDEMAND_OBJINFO(object)->ondemand_id;
>  	trace_cachefiles_ondemand_close(object, &req->msg);
>  	return 0;
>  }
> @@ -451,16 +487,7 @@ static int cachefiles_ondemand_init_read_req(struct cachefiles_req *req,
>  	struct cachefiles_object *object = req->object;
>  	struct cachefiles_read *load = (void *)req->msg.data;
>  	struct cachefiles_read_ctx *read_ctx = private;
> -	int object_id = CACHEFILES_ONDEMAND_OBJINFO(object)->ondemand_id;
>  
> -	/* Stop enqueuing requests when daemon has closed anon_fd. */
> -	if (!cachefiles_ondemand_object_is_open(object)) {
> -		WARN_ON_ONCE(object_id == 0);
> -		pr_info_once("READ: anonymous fd closed prematurely.\n");
> -		return -EIO;
> -	}
> -
> -	req->msg.object_id = object_id;
>  	load->off = read_ctx->off;
>  	load->len = read_ctx->len;
>  	trace_cachefiles_ondemand_read(object, &req->msg, load);

-- 
Thanks,
Jingbo

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

