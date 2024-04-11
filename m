Return-Path: <linux-cachefs+bncBDLIXLMFVAERBSEZ32YAMGQEQ4O7A6Q@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mail.lfdr.de (Postfix) with ESMTPS id 398918A093E
	for <lists+linux-cachefs@lfdr.de>; Thu, 11 Apr 2024 09:10:02 +0200 (CEST)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-6eb062df73csf759904a34.2
        for <lists+linux-cachefs@lfdr.de>; Thu, 11 Apr 2024 00:10:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1712819400; cv=pass;
        d=google.com; s=arc-20160816;
        b=B9PQceEo/r5TEvWZ2JQo+PyvM869tJhhmGioa1uZqv17/VzBvgJncJaxXaIL7S4D/A
         yCUC6yZUANPvg3otzd4r4866RdUE4A676k/d8caGHJr5AOGpzQhWJCZq1hr6cn7sQEzJ
         QbchfwvGS1Di1tXJSN1y4F7bc+jGPQNJaNx9sjDdbEk+027sOMm9bNzpYRSdcUGXYthA
         6Wx1Yew6yg5TloZce7pRyZxe+tLkyVvrIJYzABGCWMl8JXeET322z+lwfl8/HeZTrI3V
         ABXQus+G+hZvGF+GGu3uMV1BVFlaAxA4ZAtpis6pYh9zLLtswVmDSAif0sufVQk6+Pse
         k8fQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=+GV41AEnIUeclGPoA34GFY0PEsZ2Pk9isra39dJfiGk=;
        fh=I5WJYe6kfldCh0PDRVAK7ASY7fcqO58ISj9lsfYH2Cw=;
        b=wMjMTMJuBS03LVyN8pEzakazv9legRl/rFUxpsm4retH2tXnKMoSDJJZLxXOjiEfFV
         C4k+sCuaxQmMzbkI+VwU8zmFqyoWZQwAp1/Thw/tO3w+Nd87Z1XVzQLI1/MGCtO3/k2R
         CLJphKUVufqc4MsNV+ZYuj8PFwd3UWK/TQY3LcXYRVFYR6NPkiWzhf/dRKiKY/aaChvJ
         z5EV9RksMe39WMfZbkGtT/oopU/EZv9Kb7RU23so89g2jYYBrVYaOKNrLEAHuJ4eVolC
         8iB9Yov+4jnU2w4V91FDiVT8X7F1gVp+hinh4W7rbcVB3Xa31kkJkDx+hfxeoP8caRXT
         epjQ==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712819400; x=1713424200;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+GV41AEnIUeclGPoA34GFY0PEsZ2Pk9isra39dJfiGk=;
        b=hVMzwZ7uLyYRIiQJ8PDZ00D6WKuo7Ohzc060vk9wrLzttUuboT1PP2wrCBnD4W9eZA
         tasFQPXmAYifk2Veo+QtUI3p5WyVZHqnn1eWRPFxZcQRGshaVsgVQ4HfUl9ChwsDQ2YJ
         c3RC+J1uporAthrvydgT+UN3RYBinTHVtyOgbQ9hj6X2PyqqyW7Ogyunwak2gXBP8N19
         GszHe3e9aA5eM5aAfm+AM2WHrXTZFPsbWfBuB5qW8x4vWK8ZrsbbKiVWmhNlIZFTqbQl
         kEmZgxw8hvDMD6RIec0JvMR4vNrzc5dXCZ91puGA+s6sQ3V/uyZOHfgiNuKMJP3qB417
         tS4g==
X-Forwarded-Encrypted: i=2; AJvYcCVJgM080YWSxNOSGQcJUWroUgApgVne8202XVui+JPvGdLjeQrf2zmj6bOlBnOoDXPNXGj8y2mgoXcECjRWUhsgpxvPNtNRok7irtE=
X-Gm-Message-State: AOJu0Yyh3CKQYXGI/kdM0KFGuDYj0vgkwJSdxFo/mb9px5li4TJG6XwJ
	VyZlKRI5raRkPbC3oFIHZfn4aPKRJ5CXilVucxxbjfnJQcac8UX8JVvfhJTssgk=
X-Google-Smtp-Source: AGHT+IEOFSuD2SQ+AoqT1s0USIAHyIbm9DnUNlAdVCoYIrZNnOkEoV/nqPvRVCcp9R4LqJMBOIypqg==
X-Received: by 2002:a05:6870:a449:b0:22e:9cc0:4a9b with SMTP id n9-20020a056870a44900b0022e9cc04a9bmr4997395oal.52.1712819400565;
        Thu, 11 Apr 2024 00:10:00 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6870:164b:b0:22e:c37c:47bd with SMTP id
 c11-20020a056870164b00b0022ec37c47bdls8205oae.2.-pod-prod-04-us; Thu, 11 Apr
 2024 00:09:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUFM7SRtPfgtxNmgZmfOZe0M6L887E14+7b6BSeJy6AsvQIK8gT0+rMWIMF4h05VXltkPpGx/eOICuC2FDNnl+k8VhDH3Hv/ecreF3/3e0=
X-Received: by 2002:a05:6808:13c6:b0:3c3:cd86:b834 with SMTP id d6-20020a05680813c600b003c3cd86b834mr4625029oiw.42.1712819399698;
        Thu, 11 Apr 2024 00:09:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712819399; cv=none;
        d=google.com; s=arc-20160816;
        b=ak40FszyzJPXArdZWuDXRthgP75zOqk/WsxJy0I7nRTMaVSjcAMbva9lUgYtNcCMQ5
         4eEjq4VonnwMlA4TL7EHqqAaGzDgnDnEJR72AY0fzfgmWsI+mGpqm084/j6IKh9f8OqI
         uJsdpCopZNWxCVqKgxgFw/pd6aLlxm6ubQbywn7WpQfVaXuLo10i8Y5bJnrw9+6Fnp77
         zDPsuAmyihoCaAHUD67sF0+IkvXh8dTQ+hvW/L3CbeJVjh5r7p1AtGLfHk4y/mVMqhBm
         FHTRBFHlFnMRUHdxmbmndbfYOfSHDan57U0wY9NujjBoxozouYpUTA+TiUd1EPBGw7zx
         YKyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=196npT4dFchpncO+F+T8cryfMJBQCoPIx07TaE5P/mU=;
        fh=iSaLwgaHOKvfADkzLOGFrUURay6x1sWG9M5uP1y/TYA=;
        b=EipLDOjJ6cvoMUR9jhDsRZIcmRuiPWJQhiB7iGje+Bm4L7GIjFUJ0HInIrObJm2Ql7
         Q3T/ceGILvFbGlj7tMpMFvG6kGSmCHdCiBPPd6qobD8Ltd5TM/Q0ew9JN0S3+wXsPLJ2
         icA46/v6FW3PnKCgXyloIfAmPlKJgJMOcYe16FXVibZogF/dm3egjWnWpjyhr3ZY7iSo
         zCDzlobuXVOaQwgL8XREII1LpqQvCu9jVRND6L/AuKMhS3sG9CfwFJmthi+4sPxCsSoE
         NTXeM16Ln4xQnVJhJ/mxMrSRqQae7g6/1qvmRVVneTfMR/ZPH1kigExiTQQvmONwD44m
         6h+g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id u8-20020a05620a022800b0078a0b02960fsi918613qkm.232.2024.04.11.00.09.59
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 00:09:59 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-665-swUcc1RsNXGjP4d-mPxzmg-1; Thu,
 11 Apr 2024 03:09:55 -0400
X-MC-Unique: swUcc1RsNXGjP4d-mPxzmg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CAAB38143A7
	for <linux-cachefs@gapps.redhat.com>; Thu, 11 Apr 2024 07:09:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 094D72166B36; Thu, 11 Apr 2024 07:09:55 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3F2182166B34;
	Thu, 11 Apr 2024 07:09:51 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20240410173815.GA514426@kernel.org>
References: <20240410173815.GA514426@kernel.org> <20240401135351.GD26556@kernel.org> <20240328163424.2781320-1-dhowells@redhat.com> <20240328163424.2781320-27-dhowells@redhat.com> <3002686.1712046757@warthog.procyon.org.uk>
To: Simon Horman <horms@kernel.org>
Cc: dhowells@redhat.com, Christian Brauner <christian@brauner.io>,
    Jeff Layton <jlayton@kernel.org>,
    Gao Xiang <hsiangkao@linux.alibaba.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Matthew Wilcox <willy@infradead.org>,
    Steve French <smfrench@gmail.com>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>, netfs@lists.linux.dev,
    linux-cachefs@redhat.com, linux-afs@lists.infradead.org,
    linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
    ceph-devel@vger.kernel.org, v9fs@lists.linux.dev,
    linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 26/26] netfs, afs: Use writeback retry to deal with alternate keys
MIME-Version: 1.0
Date: Thu, 11 Apr 2024 08:09:46 +0100
Message-ID: <1780364.1712819386@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <1780363.1712819386.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
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

Simon Horman <horms@kernel.org> wrote:

> On Tue, Apr 02, 2024 at 09:32:37AM +0100, David Howells wrote:
> > Simon Horman <horms@kernel.org> wrote:
> > 
> > > > +	op->store.size		= len,
> > > 
> > > nit: this is probably more intuitively written using len;
> > 
> > I'm not sure it makes a difference, but switching 'size' to 'len' in kafs is a
> > separate thing that doesn't need to be part of this patchset.
> 
> Sorry, I meant, using ';' rather than ',' at the end of the line.

Ah, yes.  That makes a lot more sense!

David

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

