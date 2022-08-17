Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2146B596BEB
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Aug 2022 11:16:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660727805;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ooenn0g7AGg3/jZL/ZKxZfnue+EehEhoz4N2oMgJ1yk=;
	b=HYDcdI3yAN3yoX13QyV6EiVD0yCeQzx687HFVLCJ8EvfISCIiIra8YVtLcv5ZaeXYotNnE
	tN3t4zLkmnqfVW545k8WW/lLWU7q3WkXmK7chCjgdWv+vKUSDkX4+EkdTu+GPcXvoaVBzi
	fY+befpLBChb2w/h8WQweBZXK8dUKuM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-hSzH3dJeOim1356Y0f1wBw-1; Wed, 17 Aug 2022 05:16:43 -0400
X-MC-Unique: hSzH3dJeOim1356Y0f1wBw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A07929DD9A5;
	Wed, 17 Aug 2022 09:16:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E0617C15BBA;
	Wed, 17 Aug 2022 09:16:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 9F506194E009;
	Wed, 17 Aug 2022 09:16:41 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 21781193F6F6 for <linux-cachefs@listman.corp.redhat.com>;
 Wed, 17 Aug 2022 09:16:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 99C011121319; Wed, 17 Aug 2022 09:16:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95B9B1121315
 for <linux-cachefs@redhat.com>; Wed, 17 Aug 2022 09:16:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7226A1C0515C
 for <linux-cachefs@redhat.com>; Wed, 17 Aug 2022 09:16:39 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-92-JU-tus9FPLuh9QGQXvtFWA-1; Wed, 17 Aug 2022 05:16:37 -0400
X-MC-Unique: JU-tus9FPLuh9QGQXvtFWA-1
Received: by mail-lj1-f174.google.com with SMTP id x10so12980714ljq.4
 for <linux-cachefs@redhat.com>; Wed, 17 Aug 2022 02:16:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc;
 bh=3DB+dezKTs2JCAGBzguUfyZl/DLCkUWxqZtpuqdZ1Ig=;
 b=LHTPdvIAO4cLn1rx/wiFEfa0N0+kpgKHrjrYLGu36yBHVFqgZEY0ncTZC2w3ds7RyN
 hHOgTYu9TDJjwcxAVlaDehXCUvnVmopXPSQy1lM97ha+to4UF9GU9+jQnhcFLEkqaluW
 q4pKPC9yXLt8u0/PEqsgDLSt4C1DV3586/No1b+mvI+3ykBhP7T1DDyrrZKx6tMJR31m
 x5GKLIU3I1U1fqtVFNy45HI3MvCGgscd1r8Rvzgm78cE4OMdj+Ze2FXyf22RGo5oh3s+
 3ZbaDv0key6ncw+EJTcuNnoLfHUQ6CQ5md7+RM6gdfxQ0qRZndojvRPstSN4xajKEYSA
 ByfA==
X-Gm-Message-State: ACgBeo2Ja5INtwDK1vq5CNC6+H4Us1VbVB470nnz6nc6v0bTAzSp0CIA
 ADiEuqHt8I/LXsP4Zq1gBcQnW5sQZTUMIgRcESh2NLi+7SgiFg==
X-Google-Smtp-Source: AA6agR69SoivTyNvZmZ8AtneNCxMvWh/r0/M/Zc73nYj7O/drQ8x3YGn6lycqk+TJCknMGEudSX4lwzY0NWVE2T30jk=
X-Received: by 2002:a05:651c:179c:b0:261:8fbe:b729 with SMTP id
 bn28-20020a05651c179c00b002618fbeb729mr3499949ljb.114.1660727796282; Wed, 17
 Aug 2022 02:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220817065200.11543-1-yinxin.x@bytedance.com>
 <YvyVOfzkITlvgtQ6@B-P7TQMD6M-0146.local>
In-Reply-To: <YvyVOfzkITlvgtQ6@B-P7TQMD6M-0146.local>
From: Xin Yin <yinxin.x@bytedance.com>
Date: Wed, 17 Aug 2022 17:16:25 +0800
Message-ID: <CAK896s71E8a_iAYwEtzp7XKopQnVT5-YnkuC3yTewOfdmvf2VQ@mail.gmail.com>
To: Xin Yin <yinxin.x@bytedance.com>, dhowells@redhat.com, xiang@kernel.org, 
 jefflexu@linux.alibaba.com, linux-fsdevel@vger.kernel.org, 
 zhujia.zj@bytedance.com, linux-cachefs@redhat.com, 
 Yongqing Li <liyongqing@bytedance.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Subject: Re: [Linux-cachefs] [External] Re: [PATCH] cachefiles: make
 on-demand request distribution fairer
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
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 17, 2022 at 3:14 PM Gao Xiang <hsiangkao@linux.alibaba.com> wrote:
>
> Hi Yin,
>
> On Wed, Aug 17, 2022 at 02:52:00PM +0800, Xin Yin wrote:
> > For now, enqueuing and dequeuing on-demand requests all start from
> > idx 0, this makes request distribution unfair. In the weighty
> > concurrent I/O scenario, the request stored in higher idx will starve.
> >
> > Searching requests cyclically in cachefiles_ondemand_daemon_read,
> > makes distribution fairer.
>
> Yeah, thanks for the catch.  The previous approach could cause somewhat
> unfairness and make some requests starving... But we don't need strict
> FIFO here.
>
> >
> > Reported-by: Yongqing Li <liyongqing@bytedance.com>
> > Signed-off-by: Xin Yin <yinxin.x@bytedance.com>
> > ---
> >  fs/cachefiles/internal.h |  1 +
> >  fs/cachefiles/ondemand.c | 12 +++++++++---
> >  2 files changed, 10 insertions(+), 3 deletions(-)
> >
> > diff --git a/fs/cachefiles/internal.h b/fs/cachefiles/internal.h
> > index 6cba2c6de2f9..2ad58c465208 100644
> > --- a/fs/cachefiles/internal.h
> > +++ b/fs/cachefiles/internal.h
> > @@ -111,6 +111,7 @@ struct cachefiles_cache {
> >       char                            *tag;           /* cache binding tag */
> >       refcount_t                      unbind_pincount;/* refcount to do daemon unbind */
> >       struct xarray                   reqs;           /* xarray of pending on-demand requests */
> > +     unsigned long                   req_id_next;
>
>         unsigned long                   ondemand_req_id_next; ?
Hi Xiang,

Thanks for the detailed review , whether "ondemand_req_id_next" is a
little long ? struct cachefiles_cache only holds on-demand requests ,
so I think "req_id_next" will not cause ambiguity. Does this make
sense?

Thanks,
Xin Yin
>
> Otherwise it looks good to me,
>
> Thanks,
> Gao Xiang
>
> >       struct xarray                   ondemand_ids;   /* xarray for ondemand_id allocation */
> >       u32                             ondemand_id_next;
> >  };
> > diff --git a/fs/cachefiles/ondemand.c b/fs/cachefiles/ondemand.c
> > index 1fee702d5529..247961d65369 100644
> > --- a/fs/cachefiles/ondemand.c
> > +++ b/fs/cachefiles/ondemand.c
> > @@ -238,14 +238,19 @@ ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
> >       unsigned long id = 0;
> >       size_t n;
> >       int ret = 0;
> > -     XA_STATE(xas, &cache->reqs, 0);
> > +     XA_STATE(xas, &cache->reqs, cache->req_id_next);
> >
> >       /*
> > -      * Search for a request that has not ever been processed, to prevent
> > -      * requests from being processed repeatedly.
> > +      * Cyclically search for a request that has not ever been processed,
> > +      * to prevent requests from being processed repeatedly, and make
> > +      * request distribution fair.
> >        */
> >       xa_lock(&cache->reqs);
> >       req = xas_find_marked(&xas, UINT_MAX, CACHEFILES_REQ_NEW);
> > +     if (!req && cache->req_id_next > 0) {
> > +             xas_set(&xas, 0);
> > +             req = xas_find_marked(&xas, cache->req_id_next - 1, CACHEFILES_REQ_NEW);
> > +     }
> >       if (!req) {
> >               xa_unlock(&cache->reqs);
> >               return 0;
> > @@ -260,6 +265,7 @@ ssize_t cachefiles_ondemand_daemon_read(struct cachefiles_cache *cache,
> >       }
> >
> >       xas_clear_mark(&xas, CACHEFILES_REQ_NEW);
> > +     cache->req_id_next = xas.xa_index + 1;
> >       xa_unlock(&cache->reqs);
> >
> >       id = xas.xa_index;
> > --
> > 2.25.1
> >
> > --
> > Linux-cachefs mailing list
> > Linux-cachefs@redhat.com
> > https://listman.redhat.com/mailman/listinfo/linux-cachefs

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

