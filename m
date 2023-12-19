Return-Path: <linux-cachefs+bncBDLIXLMFVAERBRGXQ2WAMGQE3CCZOSI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mail.lfdr.de (Postfix) with ESMTPS id CD940818A4B
	for <lists+linux-cachefs@lfdr.de>; Tue, 19 Dec 2023 15:42:13 +0100 (CET)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-42599db593fsf75416871cf.0
        for <lists+linux-cachefs@lfdr.de>; Tue, 19 Dec 2023 06:42:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702996933; cv=pass;
        d=google.com; s=arc-20160816;
        b=JVVHDtZJbei3ankFAR8z/gVlpqoIquxCHQx6V0ESwj2eaERMPazU7uV08p20yrNVW/
         IqbPL0bcsqjg21N9HKjg9tWuuoAAQk8VCc/vFse8Gf4Br42HWSZev7J3ZkhHGurq+WIV
         +7HPrl4aEJcqOtuq7iBAf7q9cNW4ZkY0sYcerpKvUEFKJdcGuF3sR+cdHqHVuOxbNyj9
         hk494DimuO0vzAl1OUm+yGQis3fGie+SlimQgBh+XxFQtm3gMvzYHCsdmGf3sVwIUnc+
         yNNySzwCEG1QEQY6EFyBUCUxd4QvKF074ZTpPG5D3DHR0cxXlXwWped8P2ij2MXAOp+T
         WGdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=wYCydE2ZIcDUpvFlYwpxBc+sQfdCwBYbBsg/xUBeVyA=;
        fh=oTSheoojIQWE85h15wIbFV5tdQ792s9VwZPsELvSY7c=;
        b=uqOysxOjzfciufFcWJteuCf+xP0mIRl6wHmurvzlcDpKCL/ZJJbei2Of7Bx2xCJSL7
         oKej7zXNY9JXlCVmiCsa8ao4m62jRA7109CfiNyPc2R+Y4OGNSydRgdCw9n3jo7eu1RF
         E+JDY1/sZQ8Xs8q50hCX5Uu1mS+W9ELWxtEnNG/904KJJaaMYaaR5+WupXpqvU/RxYvz
         aaVOo5qhL1RSbHfac9pkyxnEuMG8+5Vw6j6RrxwmUcnwuRe9jWjSqhgJPAHfV4xNCbTP
         GAv6U9nNm0i+oNVGe9boFf/sJXvRnLcAaQZzx4Zlhc/KK5WgKtYvVvdgj9tr7uirmqdg
         MoWg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702996933; x=1703601733;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wYCydE2ZIcDUpvFlYwpxBc+sQfdCwBYbBsg/xUBeVyA=;
        b=vvounOlgcBoVQtkcjhLDxxhxUbJtmTc8uOHzP6+50NVnJMb6ANCxP5eiSe0YDOjnBT
         mLCJRaN0uH0YE+ZE7r3fqVxavfu5NFNhteIjfdALqTTi/3/35Zbv3uIZv2rNwH/ojZ7D
         qT94J8feLHINNxXTnDlGnQpxZQHaew0GvQhQc4DEEDvojy7IaxSF8ag7mPAj8PeGBYf4
         yNYm+I94Aacg/wCzRo2aEXpDaHl494ikYG+fgIndgWz0Z0Pr15Nj0l5uzSoR0ZY/du9S
         AJSdlRkBXH/P3antPoJfeqw8YHjVbhJB3YpJA25ZSJtFe9gLKlzmCpDenYSmyHtGlCBa
         6+OA==
X-Gm-Message-State: AOJu0YxGsQbvLM8wDF2+eP9LXYUzBxK+wtRUEFjkmOtO+yQUQjjRa+Ti
	PvAKqUgslJSFiPxDlLpo4+cjfCnlGxuIAg==
X-Google-Smtp-Source: AGHT+IEwpTzyegOkcB0Yng3H1sRUbupN+5Ai7TiUfZIUJ+K4AYHO9n4sipX9DGLXKaCc1/PtavI3vg==
X-Received: by 2002:a05:622a:3ca:b0:425:6212:c4d1 with SMTP id k10-20020a05622a03ca00b004256212c4d1mr1751825qtx.50.1702996932887;
        Tue, 19 Dec 2023 06:42:12 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:490b:0:b0:423:707e:9eb with SMTP id e11-20020ac8490b000000b00423707e09ebls553309qtq.0.-pod-prod-00-us;
 Tue, 19 Dec 2023 06:42:12 -0800 (PST)
X-Received: by 2002:ac8:7f4b:0:b0:425:93d0:8267 with SMTP id g11-20020ac87f4b000000b0042593d08267mr1363596qtk.48.1702996932324;
        Tue, 19 Dec 2023 06:42:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702996932; cv=none;
        d=google.com; s=arc-20160816;
        b=Nmn0NhIO9HTxCc4o7D4bTgDMfgSwJkV530ia/gdgfp5nycMub1bhFHhetRkE+CsSmC
         YTFu6KCNvm26AfQpJAB5DejfI7bU03xKc15bL+01ljkw01W5iSYEUK6+0t1OQf6Fe+PX
         dEMw8ZBDVFYSwgolH6l8LIW/WH/YiPJZ+cXPSmOCnLXx12ChvNBAK0iQr8ozpRsP0jIa
         Cb8lI68NUDP+WzdkE8ftE4IpfzWiu+lrwUTzFC9mxBtI1JLo06oHAPv+HV6755CgR+PD
         Yh3XDASWcu9sZ/KLlVI+ApC7LCXh5MqDuybdwk/oTq09VTPow/Jd+0uXqQOjSqONS10X
         tT6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=lth9g4AW0anOZ4LWZCPXiR+JOlzio4MLzJH0TOMFa1w=;
        fh=oTSheoojIQWE85h15wIbFV5tdQ792s9VwZPsELvSY7c=;
        b=J4k4iGuGd1KSku3fa7Fy+cZXQ5OGre2r6FtYm7kqmp5n0ODAj72VorqgzjxwY6pfKX
         ZczKUVciVHmSVhl03ZlVVscpS7pr+to0OQrSmhoZh3/DAuSpOB+d3DyVVQl3NhPC+QSa
         fVfhHO1hilqZij1IOYud9jx7CClNeMqQWFObkYE9FH2kloY7dFB22gxUzElzCEIMwMl3
         ltpwl9CCGUVmEQcnHQrMf36nf6fmXe/YqtjvJfqgDFaAnj2TkHYMrJc2gB3t1LvnoxZk
         ju6akPo+olXDEv8SuoH9MbOVUWpXZjYnZwxT5B9ObBT1EpyvxQB9Vy9tx/5J1atmkya1
         0TbA==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id bw13-20020a05622a098d00b0042540184032si27999444qtb.336.2023.12.19.06.42.12
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 06:42:12 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-564-zQeInFx3ON6YPzdkQJsiFA-1; Tue,
 19 Dec 2023 09:42:10 -0500
X-MC-Unique: zQeInFx3ON6YPzdkQJsiFA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92EF31C0513E
	for <linux-cachefs@gapps.redhat.com>; Tue, 19 Dec 2023 14:42:10 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 90359492BC8; Tue, 19 Dec 2023 14:42:10 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7E9F492BC6;
	Tue, 19 Dec 2023 14:42:07 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <6f8c3f22f77e9e0154f4131260559c39d6740678.camel@kernel.org>
References: <6f8c3f22f77e9e0154f4131260559c39d6740678.camel@kernel.org> <20231213152350.431591-1-dhowells@redhat.com> <20231213152350.431591-19-dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: dhowells@redhat.com, Steve French <smfrench@gmail.com>,
    Matthew Wilcox <willy@infradead.org>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>,
    Christian Brauner <christian@brauner.io>, linux-cachefs@redhat.com,
    linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
    linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
    v9fs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 18/39] netfs: Export netfs_put_subrequest() and some tracepoints
MIME-Version: 1.0
Date: Tue, 19 Dec 2023 14:42:07 +0000
Message-ID: <488867.1702996927@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <488866.1702996927.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Jeff Layton <jlayton@kernel.org> wrote:

> Erm...why? Are these called directly from module code in a later patch?

Yes.  I'll expand the commit message.

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

