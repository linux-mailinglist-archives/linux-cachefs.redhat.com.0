Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B97384F3C75
	for <lists+linux-cachefs@lfdr.de>; Tue,  5 Apr 2022 17:55:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649174124;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yzVQ5zAIrZ081Ku4Epv49HS5wzlQxybgvtwDI0xn9Ts=;
	b=FLJHz/ydWvZArIoYI/GRHY9eetwKyKVzoAM5ddh3d0LDn5hlimKJMuo6egfYUqGR7+oiCi
	WzXx8B8TLKrhuIIU4PneiZWRhSnHMpnHdgrzEWIDe75yLfm5JbhOVgPmGcPlaKGLTs9UDt
	x+72B0Ng/RjZNKAEMjKt5GLaHtjox68=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-VfadPl70O-Gh1Bys2XD4yQ-1; Tue, 05 Apr 2022 11:55:21 -0400
X-MC-Unique: VfadPl70O-Gh1Bys2XD4yQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0886E3C14845;
	Tue,  5 Apr 2022 15:55:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F079F42B94A;
	Tue,  5 Apr 2022 15:55:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 89F46194036C;
	Tue,  5 Apr 2022 15:55:19 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BD1BF1947BBD for <linux-cachefs@listman.corp.redhat.com>;
 Tue,  5 Apr 2022 15:55:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AB93C42B952; Tue,  5 Apr 2022 15:55:17 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A766642B94A
 for <linux-cachefs@redhat.com>; Tue,  5 Apr 2022 15:55:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 83441803D7A
 for <linux-cachefs@redhat.com>; Tue,  5 Apr 2022 15:55:17 +0000 (UTC)
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-IrJVEMH_MQCSJ2I-eMcgJA-1; Tue, 05 Apr 2022 11:55:11 -0400
X-MC-Unique: IrJVEMH_MQCSJ2I-eMcgJA-1
Received: by mail-ej1-f69.google.com with SMTP id
 qw30-20020a1709066a1e00b006e7f3de1be3so3148797ejc.11
 for <linux-cachefs@redhat.com>; Tue, 05 Apr 2022 08:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oUGf2ZzFBlqLs6dPsgowfYrL5l+4T7WVAGTyEQhZU7k=;
 b=iOG0OthnvdnaEJJ23HSiTfgERy551/ZW077O3SZ01lxSm17wMPw0e9xnsmTX+S7rTi
 ttyFu7CbtVRuRlwgK1YhbbIclD/evclpf4u8KQkucUE15CkIIzSXkTx+Y1xbir7BpMqJ
 vg47ZDJHRyANPVmi9PaynllhRSDBfsABIwZyQ1eep5PrUOKG03MOqa6CMf9u9iiPageX
 JD7tu2NrPpnSXYHlyNFa77b02AH3Lf6rjCvKXML5BeEWFbJPxoJym2YZwvDddWnII0wx
 tdwGvhQv+0hLyKTjKIVtQO4gg1FePZ13renA7Ad/0DDuCu1gmCKXVCSYea+CIsZspe5u
 u8lw==
X-Gm-Message-State: AOAM530a7FImfBVFkPVgGC87hylMsJmGfjmeQncfDng3CZutrIzPeaC+
 Kr/OKhgV/OnwcUYWa9RHlsDLPRunLTSQa4p2CbghW1dIbOdsyzRE2v5Q5xqxYQhROUXAuaMFAsu
 +ZRvpL2dKyuRLE34sjLtbOCrZdovj9XSDr6lg9A==
X-Received: by 2002:a50:e79b:0:b0:41c:dd2c:3e19 with SMTP id
 b27-20020a50e79b000000b0041cdd2c3e19mr4308733edn.291.1649174110114; 
 Tue, 05 Apr 2022 08:55:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzUUvwBxFtq2BY8mzd78qIMjht5DdA2cwVsjyZufq034uibZpjtPkdQsNyuP+paR+kBgPKJIV7NxIo0lQMxQbE=
X-Received: by 2002:a50:e79b:0:b0:41c:dd2c:3e19 with SMTP id
 b27-20020a50e79b000000b0041cdd2c3e19mr4308718edn.291.1649174109970; Tue, 05
 Apr 2022 08:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220405134649.6579-1-dwysocha@redhat.com>
 <1788451.1649168050@warthog.procyon.org.uk>
 <CALF+zOn+JEB7F30wMEcs3Zm=2HFMXS+8vfiQP9HW26OtwXUHGg@mail.gmail.com>
In-Reply-To: <CALF+zOn+JEB7F30wMEcs3Zm=2HFMXS+8vfiQP9HW26OtwXUHGg@mail.gmail.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Tue, 5 Apr 2022 11:54:33 -0400
Message-ID: <CALF+zOksePcvCzY4kTrkZeEJOxxNkxu2f=PTM_3SSoYtYo_1PA@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: Re: [Linux-cachefs] [PATCH] cachefiles: Fix KASAN
 slab-out-of-bounds in cachefiles_set_volume_xattr
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
Cc: Steve French <smfrench@gmail.com>, linux-cachefs <linux-cachefs@redhat.com>,
 Jeff Layton <jlayton@kernel.org>, linux-cifs <linux-cifs@vger.kernel.org>
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 5, 2022 at 10:24 AM David Wysochanski <dwysocha@redhat.com> wrote:
>
> On Tue, Apr 5, 2022 at 10:14 AM David Howells <dhowells@redhat.com> wrote:
> >
> > Dave Wysochanski <dwysocha@redhat.com> wrote:
> >
> > > @@ -203,7 +203,7 @@ bool cachefiles_set_volume_xattr(struct cachefiles_volume *volume)
> > >       if (!buf)
> > >               return false;
> > >       buf->reserved = cpu_to_be32(0);
> > > -     memcpy(buf->data, p, len);
> > > +     memcpy(buf->data, p, volume->vcookie->coherency_len);
> >
> > Good catch.  However, I think it's probably better to change things a bit
> > further up, eg.:
> >
> >         -       len += sizeof(*buf);
> >         -       buf = kmalloc(len, GFP_KERNEL);
> >         +       buf = kmalloc(sizeof(*buf) + len, GFP_KERNEL);
> >
> > David
> >
>
> Agree with the above.  I'll send a v2.  Thanks!

After I looked at this again I realized 'len' is used in
vfs_setxattr() and needs to be the size of the kmalloc'd memory.
So we need another adjustment there or the v1 patch.

    191 bool cachefiles_set_volume_xattr(struct cachefiles_volume *volume)
    192 {
    193         struct cachefiles_vol_xattr *buf;
    194         unsigned int len = volume->vcookie->coherency_len;
    195         const void *p = volume->vcookie->coherency;
    196         struct dentry *dentry = volume->dentry;
    197         int ret;
    198
    199         _enter("%x,#%d", volume->vcookie->debug_id, len);
    200
    201         buf = kmalloc(sizeof(*buf) + len, GFP_KERNEL);
    202         if (!buf)
    203                 return false;
    204         buf->reserved = cpu_to_be32(0);
    205         memcpy(buf->data, p, len);
    206
    207         ret = cachefiles_inject_write_error();
    208         if (ret == 0)
    209                 ret = vfs_setxattr(&init_user_ns, dentry,
cachefiles_xattr_cache,
    210                                    buf, len, 0);

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

